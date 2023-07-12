import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';

abstract class IAccessibilityFactory <T extends IAccessibilityValidator> {
  final T validator;

  IAccessibilityFactory({
    required this.validator,
  });
}