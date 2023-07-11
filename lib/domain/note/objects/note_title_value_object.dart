
import '../../../../core/objects/value_object.dart';
import '../interfaces/i_note_validator.dart';

class NoteTitleValueObject<T extends INoteValidator> extends ValueObject<String> {
  factory NoteTitleValueObject({required String title, required T validator}) {
    return NoteTitleValueObject._(
      value: validator.validateNoteTitle(
        title: title,
      ),
    );
  }

  const NoteTitleValueObject._({required super.value});
}
