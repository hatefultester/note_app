import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/accessibility_entity.dart';
import '../../domain/factories/accessibility_factory.dart';
import '../../domain/interfaces/accessibility_interfaces.dart';
import '../../../../core/domain/errors/failure.dart';
import '../local_sources/accessibility_persistence.dart';

import '../validators/accessibility_validator.dart';

class AccessibilityRepository
    implements
        IAccessibilityRepository<AccessibilityPersistence,
            AccessibilityValidator> {
  @override
  final AccessibilityFactory<AccessibilityValidator> factory =
      AccessibilityFactory<AccessibilityValidator>(
    validator: AccessibilityValidator(),
  );

  @override
  Future<Either<Failure, AccessibilityEntity<AccessibilityValidator>>>
      getAccessibility() async {
    final Either<Failure, String> persistenceResult =
        await persistence.getAccessibilityFromPersistenceAsJSONString();

    return await persistenceResult.fold(
      (l) {
        debugPrint(l.message);
        return Left(l);
      },
      (r) async {
        final Either<Failure, AccessibilityEntity<AccessibilityValidator>>
            factoryResult =
            await factory.getAccessibilityEntityFromJSONString(source: r);

        return factoryResult;
      },
    );
  }

  @override
  final AccessibilityPersistence persistence = AccessibilityPersistence();

  @override
  Future<Either<Failure, Unit>> restoreAccessibility() async {
    final Either<Failure, Unit> persistenceResult = await persistence.clear();

    return persistenceResult;
  }

  @override
  Future<Either<Failure, Unit>> storeAccessibility(
      {required AccessibilityEntity<AccessibilityValidator> entity}) async {
    final Either<Failure, String> decodedAccessibilityEntityResult =
        await factory.convertAccessibilityToJsonString(entity: entity);

    return await decodedAccessibilityEntityResult.fold(
      (l) {
        debugPrint(l.message);
        return Left(l);
      },
      (r) async {
        final Either<Failure, Unit> persistenceResult =
            await persistence.storeAccessibilityToPersistence(jsonString: r);
        return persistenceResult;
      },
    );
  }
}
