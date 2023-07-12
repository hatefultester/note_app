import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/factory/accessibility_factory.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';

import '../../core/error/failure.dart';
import '../entity/accessibility_entity.dart';

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
