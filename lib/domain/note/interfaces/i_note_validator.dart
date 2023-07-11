import 'package:dartz/dartz.dart';
import '../model/note_status_model.dart';
import '../model/note_time_stamp_model.dart';

import '../../../../core/error/value_failure.dart';

abstract class INoteValidator {

  // static const int noteDescriptionMaxLength = 250;
  // static const int noteDescriptionMinLength = 20;
  //
  // static const int noteTitleMaxLength = 20;
  // static const int noteTitleMinLength = 4;
  //
  // static const NotePriority defaultNotePriority = NotePriority.major;

  Either<ValueFailure<String>, String> validateNoteTitle({required String title});
  Either<ValueFailure<String>, String> validateNoteDescription({required String description});
  Either<ValueFailure<NoteStatusModel>, NoteStatusModel> validateNoteStatus({required NoteStatusModel status});
  Either<ValueFailure<NoteTimeStampModel>, NoteTimeStampModel> validateNoteTimestamp({required NoteTimeStampModel timeStamp});
}
