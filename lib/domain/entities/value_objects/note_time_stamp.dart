import 'package:dartz/dartz.dart';
import '../../../core/error/value_failure.dart';

import '../../model/time_stamp.dart';
import '../../../core/objects/value_object.dart';

class NoteTimeStamp extends ValueObject<TimeStampModel> {
  factory NoteTimeStamp({required TimeStampModel model}) {
    final Either<ValueFailure<TimeStampModel>, TimeStampModel>
        validatedTimeStamp = Right(model);

    return NoteTimeStamp._(value: validatedTimeStamp);
  }

  factory NoteTimeStamp.initial() {
    DateTime creationTime = DateTime.now();

    return NoteTimeStamp._(
      value: Right(
        TimeStampModel(
          creationTime: creationTime,
          lastEditTime: null,
        ),
      ),
    );
  }

  const NoteTimeStamp._({required super.value});
}
