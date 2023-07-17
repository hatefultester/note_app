import 'package:dartz/dartz.dart';
import 'package:note_app/feature/accessibility/domain/factories/accessibility_factory.dart';
import 'package:note_app/feature/accessibility/domain/interfaces/accessibility_interfaces.dart';

import '../../../../core/domain/errors/failure.dart';
import '../entities/accessibility_entity.dart';

abstract class IAccessibilityRepository<P extends IAccessibilityPersistence,
    V extends IAccessibilityValidator> {
  final AccessibilityFactory<V> factory;
  final P persistence;

  IAccessibilityRepository({
    required this.factory,
    required this.persistence,
  });

  Future<Either<Failure, AccessibilityEntity<V>>> getAccessibility();

  Future<Either<Failure, Unit>> storeAccessibility({required AccessibilityEntity<V> entity});

  Future<Either<Failure, Unit>> restoreAccessibility();
}
