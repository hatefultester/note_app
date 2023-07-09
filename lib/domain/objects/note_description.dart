import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/value_failure.dart';

import '../../core/objects/value_object.dart';
import '../rules/validation_rules.dart';

Either<ValueFailure<String>, String> _validateNoteDescription(
    {required String description}) {
  final int descriptionLength = description.length;
  final int descriptionLengthWithoutSpaces = description.replaceAll(" ", '').length;


  bool minimalLengthReached = descriptionLengthWithoutSpaces > noteDescriptionMinLength;
  bool maximalLengthReached = descriptionLength > noteDescriptionMaxLength;

  if (!minimalLengthReached) {
    return Left(
      MinimalLengthNotReachedFailure(
        value: description,
        message: 'Minimal length required for description was not reached!',
        minimalLengthRequired: noteDescriptionMinLength,
        lengthReached: descriptionLengthWithoutSpaces,
      ),
    );
  }

  if(maximalLengthReached) {
    return Left(
      MaximalLengthReachedFailure(
        value: description,
        message: 'Minimal length required for description was not reached!',
        maximalLengthAllowed: noteDescriptionMinLength,
        lengthReached: descriptionLength,
      ),
    );
  }

  return Right(description);
}

class NoteDescription extends ValueObject<String> {
  factory NoteDescription({required String description}) {
    return NoteDescription._(
      value: _validateNoteDescription(description: description),
    );
  }

  const NoteDescription._({required super.value});
}
