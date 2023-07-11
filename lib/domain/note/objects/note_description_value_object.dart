import '../../core/error/value_object.dart';
import '../interfaces/i_note_validator.dart';

class NoteDescriptionValueObject<T extends INoteValidator> extends ValueObject<String> {
  factory NoteDescriptionValueObject({required String description, required T validator}) {
    return NoteDescriptionValueObject._(
      value: validator.validateNoteDescription(
        description: description,
      ),
    );
  }

  const NoteDescriptionValueObject._({required super.value});
}