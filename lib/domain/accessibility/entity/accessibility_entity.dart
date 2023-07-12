import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:note_app/domain/accessibility/objects/accessibility_value_objects.dart';

class AccessibilityEntity extends Equatable {
  final Brightness brightness;
  final ThemeColorValueObject themeColor;
  final PriorityColorValueObject priorityColor;
  final FontSizeValueObject fontSize;

  const AccessibilityEntity._({
    required this.brightness,
    required this.themeColor,
    required this.priorityColor,
    required this.fontSize,
  });

  @override
  List<Object?> get props => [fontSize, themeColor, priorityColor, brightness];
}
