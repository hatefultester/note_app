import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/domain/note/interfaces/i_note_persistence.dart';

class NotePersistence implements INotePersistence {
  @override
  Future<Either<Failure, String>> getNotesFromPersistenceAsJSONString() {
    // TODO: implement getNotesFromPersistenceAsJSONString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeNotesToPersistence({required String jsonString}) {
    // TODO: implement storeNotesToPersistence
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }
}