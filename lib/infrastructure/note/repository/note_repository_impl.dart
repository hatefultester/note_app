import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/domain/note/entity/note_entity.dart';
import 'package:note_app/domain/note/factory/note_factory.dart';
import 'package:note_app/domain/note/repository/note_repository.dart';
import 'package:note_app/infrastructure/note/persistence/note_persistence.dart';
import 'package:note_app/infrastructure/note/validator/note_validator.dart';

class NoteRepositoryImpl implements NoteRepository<NotePersistence, NoteValidator> {
  @override
  Future<Either<Failure, Unit>> addNote({required NoteEntity<NoteValidator> note}) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  // TODO: implement factory
  NoteFactory<NoteValidator> get factory => throw UnimplementedError();

  @override
  Future<Either<Failure, NoteEntity<NoteValidator>>> getNoteById({required String id}) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoteEntity<NoteValidator>>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  // TODO: implement persistence
  NotePersistence get persistence => throw UnimplementedError();

  @override
  Future<Either<Failure, Unit>> removeAllNotes() {
    // TODO: implement removeAllNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeNote({required NoteEntity<NoteValidator> note}) {
    // TODO: implement removeNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeNoteById({required String id}) {
    // TODO: implement removeNoteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveNote({required NoteEntity<NoteValidator> note}) {
    // TODO: implement saveNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeNotes() {
    // TODO: implement storeNotes
    throw UnimplementedError();
  }
}