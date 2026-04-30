abstract class Failure {
  const Failure(this.message);
  final String message;
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Failed to access local storage']);
}

class CalculationFailure extends Failure {
  const CalculationFailure([super.message = 'Failed to calculate area']);
}

class PermissionFailure extends Failure {
  const PermissionFailure([super.message = 'Location permission denied']);
}
