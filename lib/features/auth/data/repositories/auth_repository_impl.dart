import 'package:area_and_plot/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:area_and_plot/features/auth/domain/entities/app_user.dart';
import 'package:area_and_plot/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  @override
  Stream<AppUser?> get authStateChanges => _dataSource.authStateChanges;

  @override
  Future<AppUser> signInWithGoogle() => _dataSource.signInWithGoogle();

  @override
  Future<void> signOut() => _dataSource.signOut();
}
