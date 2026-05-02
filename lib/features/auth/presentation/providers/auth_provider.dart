import 'package:area_and_plot/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:area_and_plot/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:area_and_plot/features/auth/domain/entities/app_user.dart';
import 'package:area_and_plot/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    FirebaseAuthDataSourceImpl(FirebaseAuth.instance, GoogleSignIn()),
  );
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

class AuthState {
  const AuthState({this.isLoading = false, this.error});
  final bool isLoading;
  final String? error;
  AuthState copyWith({bool? isLoading, String? error}) =>
      AuthState(isLoading: isLoading ?? this.isLoading, error: error);
}

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  Future<void> signIn() async {
    state = const AuthState(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
      state = const AuthState();
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).signOut();
      state = const AuthState();
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }
}
