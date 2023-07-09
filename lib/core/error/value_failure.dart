import 'failure.dart';

abstract class ValueFailure<T> implements Failure {
  final T value;
  final String message;
  final dynamic stackTrace;

  const ValueFailure({required this.value, required this.message, this.stackTrace});
}

class MinimalLengthNotReachedFailure extends ValueFailure<String> {
  final int minimalLengthRequired;
  final int lengthReached;

  const MinimalLengthNotReachedFailure(
      {required super.value,
      required super.message,
        super.stackTrace,
      required this.minimalLengthRequired,
      required this.lengthReached});

  @override
  List<Object?> get props => [value, message, stackTrace, minimalLengthRequired, lengthReached];

  @override
  bool? get stringify => true;
}

class MaximalLengthReachedFailure extends ValueFailure<String> {
  final int maximalLengthAllowed;
  final int lengthReached;

  const MaximalLengthReachedFailure(
      {required super.value,
        required super.message,
        super.stackTrace,
        required this.maximalLengthAllowed,
        required this.lengthReached});

  @override
  List<Object?> get props => [value, message, stackTrace, maximalLengthAllowed, lengthReached];

  @override
  bool? get stringify => true;
}