import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/note_entity.dart';

abstract class INotePersistence {
  Future<Either<Failure, Unit>> storeNotesToPersistence({
    required List<NoteEntity> notes,
  });

  Future<Either<Failure, List<NoteEntity>>> getNotesFromPersistence();
}
