import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';

class AccessibilityFactory<T extends IAccessibilityValidator> implements IAccessibilityFactory<T> {
  @override
  final T validator;

  AccessibilityFactory({required this.validator});

}