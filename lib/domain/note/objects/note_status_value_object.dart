
import '../../core/objects/value_object.dart';
import '../interfaces/i_note_validator.dart';
import '../model/note_status_model.dart';

class NoteStatusValueObject<T extends INoteValidator> extends ValueObject<NoteStatusModel> {
  factory NoteStatusValueObject({
    required NoteStatusModel model,
    required T validator,
  }) {
    return NoteStatusValueObject._(
      value: validator.validateNoteStatus(
        status: model,
      ),
    );
  }

  const NoteStatusValueObject._({required super.value});
}