import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';
import '../../../core/validators/enum_helper.dart';
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

  Future<Either<Failure, List<NoteEntity<T>>>> getListOfNotesFromJSONString(
      {required String source}) async {
    try {
      List<NoteEntity<T>> notes = [];
      List<Map<String, dynamic>> mapList = jsonDecode(source);
      for (var element in mapList) {
        final NoteEntity<T> entity = getNoteFromMap(map: element);
        notes.add(entity);
      }
      return Right(notes);
    } on Exception catch (e) {
      return const Left(
        JsonDecodingFailure(),
      );
    }
  }

  Future<Either<Failure, String>> convertListOfNotesToJSONString(
      {required List<NoteEntity<T>> notes}) async {
    try {
      List<Map<String, dynamic>> mapList = [];

      for (var element in notes) {
        final Map<String, dynamic> map = convertNoteToMap(note: element);
        mapList.add(map);
      }

      String str = jsonEncode(
        mapList,
      );
      return Right(str);
    } catch (e) {
      return const Left(
        JsonEncodingFailure(),
      );
    }
  }

  NoteEntity<T> getNoteFromMap({required Map<String, dynamic> map}) {
    return NoteEntity(
      id: map['id'],
      description: NoteDescriptionValueObject(
        description: map['description'],
        validator: validator,
      ),
      title: NoteTitleValueObject(
        title: map['title'],
        validator: validator,
      ),
      timeStamp: NoteTimeStampValueObject(
        model: NoteTimeStampModel(
          creationTime:
              DateTime.fromMillisecondsSinceEpoch(map['creationTime']),
          lastEditTime: optionOf(map['editTime'] is int
              ? DateTime.fromMillisecondsSinceEpoch(
                  map['editTime'],
                )
              : null),
        ),
        validator: validator,
      ),
      status: NoteStatusValueObject(
        model: NoteStatusModel(
          isNoteFinished: map['isFinished'],
          dueDate: optionOf(
            map['dueDate'] is int
                ? DateTime.fromMillisecondsSinceEpoch(
                    map['dueDate'],
                  )
                : null,
          ),
          priority: EnumHelper.enumFromString<NotePriority>(
                  NotePriority.values, map['priority'])
              .fold(
            (l) => NotePriority.major,
            (r) => r,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Map<String, dynamic> convertNoteToMap({required NoteEntity<T> note}) {
    return {
      'id': note.id,
      'title': note.title.object,
      'description': note.description.object,
      'priority': describeEnum(note.status.object.priority),
      'dueDate': note.status.object.dueDate
          .fold(() => null, (a) => a.millisecondsSinceEpoch),
      'isFinished': note.status.object.isNoteFinished,
      'creationTime': note.timeStamp.object.creationTime.millisecondsSinceEpoch,
      'editTime': note.timeStamp.object.lastEditTime
          .fold(() => null, (a) => a.millisecondsSinceEpoch),
    };
  }
}
