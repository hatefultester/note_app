
import '../../../../core/domain/value_objects/value_object.dart';
import '../interfaces/i_note_validator.dart';
import '../models/note_time_stamp_model.dart';

class NoteTimeStampValueObject<T extends INoteValidator>
    extends ValueObject<NoteTimeStampModel> {
  factory NoteTimeStampValueObject({required NoteTimeStampModel model, required T validator}) {
    return NoteTimeStampValueObject._(
        value: validator.validateNoteTimestamp(timeStamp: model));
  }

  const NoteTimeStampValueObject._({required super.value});
}