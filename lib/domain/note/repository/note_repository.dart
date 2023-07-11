import 'package:dartz/dartz.dart';
import '../factory/note_factory.dart';
import '../interfaces/i_note_persistence.dart';
import '../../../../core/error/failure.dart';
import '../entity/note_entity.dart';

abstract class NoteRepository<P extends INotePersistence> {
  final NoteFactory factory;
  final P persistence;

  NoteRepository({
    required this.factory,
    required this.persistence,
  });

  Future<Either<Failure, Unit>> addNote({
    required NoteEntity note,
  });

  Future<Either<Failure, Unit>> saveNote({
    required NoteEntity note,
  });

  Future<Either<Failure, Unit>> storeNotes();

  Future<Either<Failure, NoteEntity>> getNotes();

  Future<Either<Failure, NoteEntity>> getNoteById({
    required String id,
  });

  Future<Either<Failure, Unit>> removeNoteById({
    required String id,
  });

  Future<Either<Failure, Unit>> removeNote({
    required NoteEntity note,
  });

  Future<Either<Failure, Unit>> removeAllNotes();
}
