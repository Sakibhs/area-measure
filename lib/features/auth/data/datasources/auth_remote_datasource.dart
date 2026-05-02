import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/features/auth/domain/entities/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser> signInWithGoogle();
  Future<void> signOut();
}

class FirebaseAuthDataSourceImpl implements AuthRemoteDataSource {
  FirebaseAuthDataSourceImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<AppUser?> get authStateChanges =>
      _auth.authStateChanges().map((u) => u == null ? null : _map(u));

  @override
  Future<AppUser> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn.instance.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      if (result.user == null) throw const AuthException('Sign in failed');
      return _map(result.user!);
    } on AuthException {
      rethrow;
    } on FirebaseAuthException catch (e, st) {
      debugPrint('SIGN_IN_ERROR: $e');
      debugPrint('SIGN_IN_STACKTRACE: $st');
      if (e.code == 'network-request-failed' ||
          (e.code == 'unknown' &&
              (e.message?.contains('IOException') == true ||
                  e.message?.contains('Unable to resolve host') == true ||
                  e.message?.contains('No address associated') == true))) {
        throw const AuthException(
          'Network error. Please check your internet connection and try again.',
        );
      }
      throw AuthException(e.message ?? 'Sign in failed. Please try again.');
    } on PlatformException catch (e, st) {
      debugPrint('SIGN_IN_ERROR: $e');
      debugPrint('SIGN_IN_STACKTRACE: $st');
      if (e.code == 'network_error') {
        throw const AuthException(
          'Network error. Please check your internet connection and try again.',
        );
      }
      if (e.code == 'sign_in_canceled') {
        throw const AuthException('Sign in was cancelled.');
      }
      throw const AuthException('Sign in failed. Please try again.');
    } catch (e, st) {
      debugPrint('SIGN_IN_ERROR: $e');
      debugPrint('SIGN_IN_STACKTRACE: $st');
      throw const AuthException('Sign in failed. Please try again.');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), GoogleSignIn.instance.signOut()]);
    } catch (e, st) {
      debugPrint('SIGN_OUT_ERROR: $e');
      debugPrint('SIGN_OUT_STACKTRACE: $st');
      throw const AuthException('Sign out failed. Please try again.');
    }
  }

  AppUser _map(User user) => AppUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoURL,
      );
}
