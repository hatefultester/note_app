import 'package:dartz/dartz.dart';

import '../error/value_failure.dart';

Either<ValueFailure<String>, String> validateStringLength(
    {required String value, required int minLength, required int maxLength}) {
  final int descriptionLength = value.length;
  final int descriptionLengthWithoutSpaces = value.replaceAll(" ", '').length;

  bool minimalLengthReached = descriptionLengthWithoutSpaces > minLength;
  bool maximalLengthReached = descriptionLength > maxLength;

  if (!minimalLengthReached) {
    return Left(
      MinimalLengthNotReachedFailure(
        value: value,
        message: 'Minimal length required was not reached!',
        minimalLengthRequired: minLength,
        lengthReached: descriptionLengthWithoutSpaces,
      ),
    );
  }

  if(maximalLengthReached) {
    return Left(
      MaximalLengthReachedFailure(
        value: value,
        message: 'Minimal length required was not reached!',
        maximalLengthAllowed: maxLength,
        lengthReached: descriptionLength,
      ),
    );
  }

  return Right(value);
}
