import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';

abstract class INotePersistence {
  Future<Either<Failure, Unit>> storeNotesToPersistence({
    required String jsonString,
  });

  Future<Either<Failure, String>> getNotesFromPersistenceAsJSONString();

  Future<Either<Failure, Unit>> clear();
}
