import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/value_failure.dart';
import '../models/note_models.dart';

abstract class INoteValidator {
  Either<ValueFailure<String>, String> validateNoteTitle({required String title});
  Either<ValueFailure<String>, String> validateNoteDescription({required String description});
  Either<ValueFailure<NoteStatusModel>, NoteStatusModel> validateNoteStatus({required NoteStatusModel status});
  Either<ValueFailure<NoteTimeStampModel>, NoteTimeStampModel> validateNoteTimestamp({required NoteTimeStampModel timeStamp});
}
