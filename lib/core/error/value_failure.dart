import 'failure.dart';

abstract class ValueFailure<T> implements Failure {
  final T value;
  final String message;
  final dynamic stackTrace;

  ValueFailure({required this.value, required this.message, this.stackTrace});
}