import 'failure.dart';

abstract class ValueFailure<T> implements Failure {
  final T value;

  ValueFailure({required this.value});
}