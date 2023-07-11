import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import '../entity/note_entity.dart';
import '../interfaces/note_interfaces.dart';
import '../model/note_models.dart';
import '../objects/note_value_objects.dart';

class NoteFactory<T extends INoteValidator> implements INoteFactory<T> {
  @override
  final T validator;

  NoteFactory({required this.validator});

  @override
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
        UnexpectedFailure(
          message: 'Creating new note failed',
        ),
      );
    }
  }

  @override
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
        UnexpectedFailure(
          message: 'set description failed with exception $e',
        ),
      );
    }
  }

  @override
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
        UnexpectedFailure(
          message: 'set due date failed with exception $e',
        ),
      );
    }
  }

  @override
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
          message: 'set finished status failed with exception $e',
        ),
      );
    }
  }

  @override
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

  @override
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
          message: 'set priority status failed with exception $e',
        ),
      );
    }
  }

  @override
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
        UnexpectedFailure(
          message: 'set title failed with exception $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity<T>>>> getListOfNotesFromJSONString(
      {required String source}) async {
    try {
      List<NoteEntity<T>> notes = [];
      List<Map<String, dynamic>> mapList = jsonDecode(source);
      for (var element in mapList) {
        final Either<Failure, NoteEntity<T>> entityResult =
            getNoteFromMap(map: element);

        entityResult.fold(
          (l) {
            return Left(l);
          },
          (r) {
            notes.add(r);
          },
        );
      }
      return Right(notes);
    } on Exception catch (e) {
      return const Left(
        JsonDecodingFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, String>> convertListOfNotesToJSONString(
      {required List<NoteEntity<T>> notes}) async {
    try {
      List<Map<String, dynamic>> mapList = [];

      for (var element in notes) {
        final Either<Failure, Map<String, dynamic>> mapResult =
            convertNoteToMap(note: element);

        mapResult.fold(
          (l) {
            return Left(l);
          },
          (r) {
            mapList.add(r);
          },
        );
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

  @override
  Either<Failure, NoteEntity<T>> getNoteFromMap(
      {required Map<String, dynamic> map}) {
    try {
      return Right(
        NoteEntity(
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
              priority: EnumMapper.enumFromString<NotePriority>(
                      NotePriority.values, map['priority'])
                  .fold(
                (l) => NotePriority.major,
                (r) => r,
              ),
            ),
            validator: validator,
          ),
        ),
      );
    } on Exception catch (e) {
      return const Left(
        ConvertingMapToNoteFailure(),
      );
    }
  }

  @override
  Either<Failure, Map<String, dynamic>> convertNoteToMap(
      {required NoteEntity<T> note}) {
    try {
      return Right({
        'id': note.id,
        'title': note.title.object,
        'description': note.description.object,
        'priority': describeEnum(note.status.object.priority),
        'dueDate': note.status.object.dueDate
            .fold(() => null, (a) => a.millisecondsSinceEpoch),
        'isFinished': note.status.object.isNoteFinished,
        'creationTime':
            note.timeStamp.object.creationTime.millisecondsSinceEpoch,
        'editTime': note.timeStamp.object.lastEditTime
            .fold(() => null, (a) => a.millisecondsSinceEpoch),
      });
    } on Exception catch (e) {
      return const Left(
        MappingNoteToMapFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, NoteEntity<T>>> setPriorityFromStringInput(
      {required String priority, required NoteEntity<T> entity}) async {
    final Either<ValueFailure<String>, NotePriority> notePriority =
        EnumMapper.enumFromString<NotePriority>(
      NotePriority.values,
      priority,
    );

    return notePriority.fold(
      (l) async {
        return Left(l);
      },
      (r) async {
        return await setPriority(
          priority: r,
          entity: entity,
        );
      },
    );
  }
}
