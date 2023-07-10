import 'package:dartz/dartz.dart';

import '../../../core/error/value_failure.dart';
import '../../../core/objects/value_object.dart';
import '../../../core/validators/length_validator.dart';
import '../../business_rules/note_validation_rules.dart';

class NoteTitle extends ValueObject<String> {

  factory NoteTitle({required String title}) {
    final Either<ValueFailure<String>, String> validatedTitle =
    validateStringLength(
      value: title,
      minLength: NoteValidationRules.noteTitleMinLength,
      maxLength: NoteValidationRules.noteTitleMaxLength,
    );

    return NoteTitle._(
      value: validatedTitle,
    );
  }

  factory NoteTitle.initial() => NoteTitle(title: '');

  const NoteTitle._({required super.value});
}