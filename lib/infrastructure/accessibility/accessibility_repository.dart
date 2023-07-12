import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/entity/accessibility_entity.dart';
import 'package:note_app/domain/accessibility/factory/accessibility_factory.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';
import 'package:note_app/domain/core/error/failure.dart';
import 'package:note_app/infrastructure/accessibility/accessibility_persistence.dart';

import 'accessibility_validator.dart';

class AccessibilityRepository implements IAccessibilityRepository<AccessibilityPersistence, AccessibilityValidator> {
  @override
  // TODO: implement factory
  AccessibilityFactory<AccessibilityValidator> get factory => throw UnimplementedError();

  @override
  Future<Either<Failure, AccessibilityEntity<AccessibilityValidator>>> getAccessibility() {
    // TODO: implement getAccessibility
    throw UnimplementedError();
  }

  @override
  // TODO: implement persistence
  AccessibilityPersistence get persistence => throw UnimplementedError();

  @override
  Future<Either<Failure, Unit>> restoreAccessibility() {
    // TODO: implement restoreAccessibility
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeAccessibility({required AccessibilityEntity<AccessibilityValidator>   entity}) {
    // TODO: implement storeAccessibility
    throw UnimplementedError();
  }
}