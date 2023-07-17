import 'package:dartz/dartz.dart';
import '../../../../core/domain/errors/value_failure.dart';
import '../../domain/interfaces/note_interfaces.dart';
import '../../domain/models/note_models.dart';

class NoteValidator implements INoteValidator {
  static const int noteDescriptionMaxLength = 250;
  static const int noteDescriptionMinLength = 20;

  static const int noteTitleMaxLength = 20;
  static const int noteTitleMinLength = 4;

  @override
  Either<ValueFailure<String>, String> validateNoteDescription(
      {required String description}) {
    return validateStringLength(
        value: description,
        minLength: noteDescriptionMinLength,
        maxLength: noteDescriptionMaxLength);
  }

  @override
  Either<ValueFailure<NoteStatusModel>, NoteStatusModel> validateNoteStatus(
      {required NoteStatusModel status}) {
    return Right(status);
  }

  @override
  Either<ValueFailure<NoteTimeStampModel>, NoteTimeStampModel>
      validateNoteTimestamp({required NoteTimeStampModel timeStamp}) {
    return timeStamp.lastEditTime.fold(
      () {
        return Right(timeStamp);
      },
      (a) {
        if (a.isAfter(timeStamp.creationTime)) {
          return Right(timeStamp);
        } else {
          return Left(
            InvalidLastEditTimeFailure(
                value: timeStamp,
                message: 'Last edit time is before creation time'),
          );
        }
      },
    );
  }

  @override
  Either<ValueFailure<String>, String> validateNoteTitle(
      {required String title}) {
    return validateStringLength(
      value: title,
      minLength: noteTitleMinLength,
      maxLength: noteTitleMaxLength,
    );
  }

  Either<ValueFailure<String>, String> validateStringLength(
      {required String value, required int minLength, required int maxLength}) {
    final int descriptionLength = value.length;
    final int descriptionLengthWithoutSpaces = value.replaceAll(" ", '').length;

    bool minimalLengthReached = descriptionLengthWithoutSpaces > minLength;
    bool maximalLengthReached = descriptionLength > maxLength;

    if (!minimalLengthReached) {
      return Left(
        MinimalLengthNotReachedFailure(
          value: value,
          message: 'Minimal length required was not reached!',
          minimalLengthRequired: minLength,
          lengthReached: descriptionLengthWithoutSpaces,
        ),
      );
    }

    if (maximalLengthReached) {
      return Left(
        MaximalLengthReachedFailure(
          value: value,
          message: 'Minimal length required was not reached!',
          maximalLengthAllowed: maxLength,
          lengthReached: descriptionLength,
        ),
      );
    }

    return Right(value);
  }
}
