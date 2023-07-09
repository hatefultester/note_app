import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/value_failure.dart';

abstract class ValueObject<T> extends Equatable {
  final Either<ValueFailure<T>, T> value;

  const ValueObject({required this.value});

  @override
  List<Object?> get props {
    return value.fold(
      (l) => [
        l.value,
        l.message,
        l.stackTrace,
      ],
      (r) => [
        r,
      ],
    );
  }

  @override
  toString() => 'ValueObject: $value';
}
