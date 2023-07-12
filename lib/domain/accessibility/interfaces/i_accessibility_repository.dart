import 'package:note_app/domain/accessibility/factory/accessibility_factory.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';

abstract class IAccessibilityRepository<P extends IAccessibilityPersistence, V extends IAccessibilityValidator> {
  final AccessibilityFactory<V> factory;
  final P persistence;

  IAccessibilityRepository({
    required this.factory,
    required this.persistence,
  });
}