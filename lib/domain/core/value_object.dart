import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'value_failure.dart';

abstract class ValueObject<T> extends Equatable {
  final Either<ValueFailure<T>, T> value;

  bool get isValid => value.isRight();

  T get object => value.fold((l) => l.value, (r) => r);

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
