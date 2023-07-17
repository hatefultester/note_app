import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/failure.dart';

abstract class INotePersistence {
  Future<Either<Failure, Unit>> storeNotesToPersistence({
    required String jsonString,
  });

  Future<Either<Failure, String>> getNotesFromPersistenceAsJSONString();

  Future<Either<Failure, Unit>> clear();
}
