import 'package:dartz/dartz.dart';
import '../factory/note_factory.dart';
import '../interfaces/i_note_persistence.dart';
import '../../../../core/error/failure.dart';
import '../entity/note_entity.dart';
import '../interfaces/i_note_validator.dart';

abstract class NoteRepository<P extends INotePersistence, V extends INoteValidator> {
  final NoteFactory<V> factory;
  final P persistence;

  NoteRepository({
    required this.factory,
    required this.persistence,
  });

  Future<Either<Failure, Unit>> addNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, Unit>> saveNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, Unit>> storeNotes({required List<NoteEntity<V>> notes});

  Future<Either<Failure, List<NoteEntity<V>>>> getNotes();

  Future<Either<Failure, Unit>> removeNote({
    required NoteEntity<V> note,
  });

  Future<Either<Failure, Unit>> removeAllNotes();
}
