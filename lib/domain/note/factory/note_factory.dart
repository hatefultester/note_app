import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/note_entity.dart';
import '../interfaces/i_note_validator.dart';
import '../model/note_models.dart';
import '../objects/note_value_objects.dart';

class NoteFactory<T extends INoteValidator> {
  final T validator;

  NoteFactory({required this.validator});

  Future<Either<Failure, NoteEntity<T>>> createNewNote() async {
    try {
      final NoteEntity<T> note = NoteEntity(
        id: DateTime.now().toIso8601String(),
        description: NoteDescriptionValueObject(
          description: '',
          validator: validator,
        ),
        title: NoteTitleValueObject(
          title: '',
          validator: validator,
        ),
        timeStamp: NoteTimeStampValueObject(
          model: NoteTimeStampModel(
            creationTime: DateTime.now(),
            lastEditTime: none(),
          ),
          validator: validator,
        ),
        status: NoteStatusValueObject(
          model: NoteStatusModel(
            isNoteFinished: false,
            dueDate: none(),
            priority: NotePriority.major,
          ),
          validator: validator,
        ),
      );
      return Right(note);
    } on Exception catch (e) {
      return const Left(
        UnexpectedFailure(message: 'Creating new note failed'),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setCreationTime({
    required DateTime creationTime,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteTimeStampModel originalNoteTimeStampModel =
          entity.timeStamp.object;
      final NoteTimeStampValueObject<T> newTimeStamp = NoteTimeStampValueObject(
        model: NoteTimeStampModel(
          creationTime: creationTime,
          lastEditTime: originalNoteTimeStampModel.lastEditTime,
        ),
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        timeStamp: newTimeStamp,
      );
      return Right(
        newEntity,
      );
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
          message: 'set creation time failed with exception $e',
        ),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setDescription({
    required String description,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteDescriptionValueObject<T> newDescription =
          NoteDescriptionValueObject(
        description: description,
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        description: newDescription,
      );
      return Right(newEntity);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: 'set description failed with exception $e'),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setDueDate({
    required Option<DateTime> dueDate,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteStatusModel originalNoteStatusModel = entity.status.object;
      final NoteStatusValueObject<T> newStatus = NoteStatusValueObject(
        model: NoteStatusModel(
          isNoteFinished: originalNoteStatusModel.isNoteFinished,
          dueDate: dueDate,
          priority: originalNoteStatusModel.priority,
        ),
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        status: newStatus,
      );
      return Right(newEntity);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: 'set due date failed with exception $e'),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setFinishedStatus({
    required bool isFinished,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteStatusModel originalNoteStatusModel = entity.status.object;
      final NoteStatusValueObject<T> newStatus = NoteStatusValueObject(
        model: NoteStatusModel(
          isNoteFinished: isFinished,
          dueDate: originalNoteStatusModel.dueDate,
          priority: originalNoteStatusModel.priority,
        ),
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        status: newStatus,
      );
      return Right(newEntity);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
            message: 'set finished status failed with exception $e'),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setLastEditTime({
    required DateTime lastEditTime,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteTimeStampModel originalNoteTimeStampModel =
          entity.timeStamp.object;
      final NoteTimeStampValueObject<T> newTimeStamp = NoteTimeStampValueObject(
        model: NoteTimeStampModel(
          creationTime: originalNoteTimeStampModel.creationTime,
          lastEditTime: optionOf(
            lastEditTime,
          ),
        ),
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        timeStamp: newTimeStamp,
      );
      return Right(
        newEntity,
      );
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
          message: 'set last edit time failed with exception $e',
        ),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setPriority({
    required NotePriority priority,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteStatusModel originalNoteStatusModel = entity.status.object;
      final NoteStatusValueObject<T> newStatus = NoteStatusValueObject(
        model: NoteStatusModel(
          isNoteFinished: originalNoteStatusModel.isNoteFinished,
          dueDate: originalNoteStatusModel.dueDate,
          priority: priority,
        ),
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        status: newStatus,
      );
      return Right(newEntity);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
            message: 'set priority status failed with exception $e'),
      );
    }
  }

  Future<Either<Failure, NoteEntity<T>>> setTitle({
    required String title,
    required NoteEntity<T> entity,
  }) async {
    try {
      final NoteTitleValueObject<T> newTitle = NoteTitleValueObject(
        title: title,
        validator: validator,
      );
      final NoteEntity<T> newEntity = NoteEntity.copyFrom(
        originalNote: entity,
        title: newTitle,
      );
      return Right(newEntity);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: 'set title failed with exception $e'),
      );
    }
  }
}
