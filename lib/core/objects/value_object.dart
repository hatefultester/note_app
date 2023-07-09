import 'package:dartz/dartz.dart';

import '../error/value_failure.dart';

abstract class ValueObject<T> {
  final Either<ValueFailure<T>, T> value;

  ValueObject({required this.value});
}
