import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/domain/note/entity/note_entity.dart';
import 'package:note_app/domain/note/factory/note_factory.dart';
import 'package:note_app/domain/note/interfaces/i_note_persistence.dart';
import 'package:note_app/domain/note/interfaces/i_note_validator.dart';
import 'package:note_app/domain/note/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<Either<Failure, Unit>> addNote({required NoteEntity<INoteValidator> note}) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  // TODO: implement factory
  NoteFactory<INoteValidator> get factory => throw UnimplementedError();

  @override
  Future<Either<Failure, NoteEntity<INoteValidator>>> getNoteById({required String id}) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoteEntity<INoteValidator>>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  // TODO: implement persistence
  INotePersistence get persistence => throw UnimplementedError();

  @override
  Future<Either<Failure, Unit>> removeAllNotes() {
    // TODO: implement removeAllNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeNote({required NoteEntity<INoteValidator> note}) {
    // TODO: implement removeNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeNoteById({required String id}) {
    // TODO: implement removeNoteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveNote({required NoteEntity<INoteValidator>  note}) {
    // TODO: implement saveNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeNotes() {
    // TODO: implement storeNotes
    throw UnimplementedError();
  }

}