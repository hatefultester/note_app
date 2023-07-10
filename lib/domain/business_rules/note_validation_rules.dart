import 'package:note_app/domain/model/enums/note_priority.dart';

class NoteValidationRules {
  NoteValidationRules._();

  static const int noteDescriptionMaxLength = 250;
  static const int noteDescriptionMinLength = 20;

  static const int noteTitleMaxLength = 20;
  static const int noteTitleMinLength = 4;

  static const NotePriority defaultNotePriority = NotePriority.major;
}
