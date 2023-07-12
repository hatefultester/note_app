import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

abstract class IAccessibilityPersistence {
  Future<Either<Failure, Unit>> storeAccessibilityToPersistence({
    required String jsonString,
  });

  Future<Either<Failure, String>> getAccessibilityFromPersistenceAsJSONString();

  Future<Either<Failure, Unit>> clear();
}