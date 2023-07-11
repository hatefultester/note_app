import 'package:dartz/dartz.dart';

import '../../core/error/value_failure.dart';
import '../model/note_models.dart';

abstract class INoteValidator {
  Either<ValueFailure<String>, String> validateNoteTitle({required String title});
  Either<ValueFailure<String>, String> validateNoteDescription({required String description});
  Either<ValueFailure<NoteStatusModel>, NoteStatusModel> validateNoteStatus({required NoteStatusModel status});
  Either<ValueFailure<NoteTimeStampModel>, NoteTimeStampModel> validateNoteTimestamp({required NoteTimeStampModel timeStamp});
}
