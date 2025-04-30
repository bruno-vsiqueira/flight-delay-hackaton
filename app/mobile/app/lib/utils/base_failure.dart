class BaseFailure {
  final Object? exception;
  final StackTrace? stackTrace;
  final String? message;

  BaseFailure({this.exception, this.stackTrace, this.message});
}
