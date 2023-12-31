import 'package:dartz/dartz.dart';
import '../../../../core/domain/errors/failure.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/factories/note_factory.dart';
import '../../domain/interfaces/i_note_repository.dart';
import '../local_sources/note_persistence.dart';
import '../validators/note_validator.dart';

class NoteRepository
    implements INoteRepository<NotePersistence, NoteValidator> {
  @override
  final NoteFactory<NoteValidator> factory = NoteFactory<NoteValidator>(
    validator: NoteValidator(),
  );

  @override
  final NotePersistence persistence = NotePersistence();

  @override
  Future<Either<Failure, Unit>> addNote(
      {required NoteEntity<NoteValidator> note}) async {
    final getNotesResult = await getNotes();

    return await getNotesResult.fold((l) => Left(l), (r) async {
      r.add(note);
      return await storeNotes(
        notes: r,
      );
    });
  }

  @override
  Future<Either<Failure, List<NoteEntity<NoteValidator>>>> getNotes() async {
    final Either<Failure, String> source =
        await persistence.getNotesFromPersistenceAsJSONString();
    return source.fold((l) {
      return const Right([]);
    }, (r) async {
      final Either<Failure, List<NoteEntity<NoteValidator>>> factoryResult =
          await factory.getListOfNotesFromJSONString(source: r);
      return factoryResult;
    });
  }

  @override
  Future<Either<Failure, Unit>> removeAllNotes() async {
    final persistenceResult = await persistence.clear();
    return persistenceResult;
  }

  @override
  Future<Either<Failure, Unit>> removeNote(
      {required NoteEntity<NoteValidator> note}) async {
    final getNotesResult = await getNotes();

    return await getNotesResult.fold((l) => Left(l), (r) {
      r.remove(note);
      return const Right(unit);
    });
  }

  @override
  Future<Either<Failure, Unit>> saveNote(
      {required NoteEntity<NoteValidator> note}) async {
    final getNotesResult = await getNotes();

    return await getNotesResult.fold((l) => Left(l), (r) async {
      final foundNote = r.firstWhere((element) => element.id == note.id);

      r.remove(foundNote);
      r.add(note);
      return await storeNotes(
        notes: r,
      );
    });
  }

  @override
  Future<Either<Failure, Unit>> storeNotes(
      {required List<NoteEntity<NoteValidator>> notes}) async {
    final jsonStringConversionResult =
        await factory.convertListOfNotesToJSONString(notes: notes);
    return await jsonStringConversionResult.fold((l) => Left(l), (r) async {
      final persistenceResult =
          await persistence.storeNotesToPersistence(jsonString: r);
      return persistenceResult;
    });
  }
}
