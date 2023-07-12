import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/note_entity.dart';
import '../factory/note_factory.dart';
import 'i_note_persistence.dart';
import 'i_note_validator.dart';

abstract class INoteRepository<P extends INotePersistence, V extends INoteValidator> {
  final NoteFactory<V> factory;
  final P persistence;

  INoteRepository({
    required this.factory,
    required this.persistence,
  });

  Future<Either<Failure, Unit>> addNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, List<NoteEntity<V>>>> getNotes();

  Future<Either<Failure, Unit>> removeAllNotes();

  Future<Either<Failure, Unit>> removeNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, Unit>> saveNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, Unit>> storeNotes({required List<NoteEntity<V>> notes});
}
