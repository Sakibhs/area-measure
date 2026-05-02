class CacheException implements Exception {
  const CacheException([this.message = 'Cache error occurred']);
  final String message;
  @override
  String toString() => 'CacheException: $message';
}

class CalculationException implements Exception {
  const CalculationException([this.message = 'Calculation error occurred']);
  final String message;
  @override
  String toString() => 'CalculationException: $message';
}

class PermissionException implements Exception {
  const PermissionException([this.message = 'Permission denied']);
  final String message;
  @override
  String toString() => 'PermissionException: $message';
}

class AuthException implements Exception {
  const AuthException([this.message = 'Authentication error']);
  final String message;
  @override
  String toString() => message;
}
