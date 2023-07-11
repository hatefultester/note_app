import 'package:dartz/dartz.dart';

import '../error/value_failure.dart';

class EnumMapper {
  static Either<ValueFailure<String>, T> enumFromString<T>(Iterable<T> values,
      String value) {
    try {
      final T enumValue = values.firstWhere(
            (type) =>
        type
            .toString()
            .split(".")
            .last == value,
      );
      return Right(enumValue);
    } on StateError catch (e, s) {
      return Left(
        InvalidEnumValue(
          message: 'Enum was not found',
          value: value,
          stackTrace: s,
        ),
      );
    }
  }
}