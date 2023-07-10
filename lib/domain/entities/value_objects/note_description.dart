import 'package:dartz/dartz.dart';

import '../../../core/error/value_failure.dart';
import '../../../core/validators/length_validator.dart';
import '../../../core/objects/value_object.dart';
import '../../business_rules/note_validation_rules.dart';

class NoteDescription extends ValueObject<String> {
  factory NoteDescription({required String description}) {
    final Either<ValueFailure<String>, String> validatedDescription =
        validateStringLength(
      value: description,
      minLength: NoteValidationRules.noteDescriptionMinLength,
      maxLength: NoteValidationRules.noteDescriptionMaxLength,
    );

    return NoteDescription._(
      value: validatedDescription,
    );
  }

  factory NoteDescription.initial() => NoteDescription(description: '');

  const NoteDescription._({required super.value});
}
