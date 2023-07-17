import 'package:dartz/dartz.dart';
import '../../../../core/domain/core.dart';
import '../entities/note_entity.dart';
import 'note_interfaces.dart';
import '../models/note_models.dart';

abstract class INoteFactory<T extends INoteValidator> {
  final T validator;

  INoteFactory({
    required this.validator,
  });

  Future<Either<Failure, NoteEntity<T>>> createNewNote();

  Future<Either<Failure, NoteEntity<T>>> setDescription({
    required String description,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setDueDate({
    required Option<DateTime> dueDate,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setFinishedStatus({
    required bool isFinished,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setLastEditTime({
    required DateTime lastEditTime,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setPriority({
    required NotePriority priority,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setPriorityFromStringInput({
    required String priority,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, NoteEntity<T>>> setTitle({
    required String title,
    required NoteEntity<T> entity,
  });

  Future<Either<Failure, List<NoteEntity<T>>>> getListOfNotesFromJSONString({
    required String source,
  });

  Future<Either<Failure, String>> convertListOfNotesToJSONString({
    required List<NoteEntity<T>> notes,
  });

  Either<Failure, NoteEntity<T>> getNoteFromMap({
    required Map<String, dynamic> map,
  });

  Either<Failure, Map<String, dynamic>> convertNoteToMap({
    required NoteEntity<T> note,
  });
}
