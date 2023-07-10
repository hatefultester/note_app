import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/value_failure.dart';

import '../../../core/objects/value_object.dart';

class NoteId extends ValueObject<String> {
  factory NoteId({required String id}) {
    final Either<ValueFailure<String>, String> validatedId = Right(id);

    return NoteId._(value: validatedId);
  }

  factory NoteId.auto() {
    final String autoId = DateTime.now().toIso8601String();
    return NoteId(
      id: autoId,
    );
  }

  const NoteId._({required super.value});
}
