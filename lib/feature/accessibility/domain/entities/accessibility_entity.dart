import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:note_app/feature/accessibility/domain/interfaces/accessibility_interfaces.dart';
import 'package:note_app/feature/accessibility/domain/value_objects/accessibility_value_objects.dart';

class AccessibilityEntity<V extends IAccessibilityValidator> extends Equatable {
  final Brightness brightness;
  final ThemeColorValueObject<V> themeColor;
  final PriorityColorValueObject<V> priorityColor;
  final FontSizeValueObject<V> fontSize;

  bool isValid() {
    return themeColor.isValid && priorityColor.isValid && fontSize.isValid;
  }

  const AccessibilityEntity({
    required this.brightness,
    required this.themeColor,
    required this.priorityColor,
    required this.fontSize,
  });

  factory AccessibilityEntity.copyFrom({
    required AccessibilityEntity<V> origin,
    Brightness? brightness,
    ThemeColorValueObject<V>? themeColor,
    PriorityColorValueObject<V>? priorityColor,
    FontSizeValueObject<V>? fontSize,
  }) {
    return AccessibilityEntity(
      brightness: brightness ?? origin.brightness,
      themeColor: themeColor ?? origin.themeColor,
      priorityColor: priorityColor ?? origin.priorityColor,
      fontSize: fontSize ?? origin.fontSize,
    );
  }

  @override
  List<Object?> get props => [
        fontSize,
        themeColor,
        priorityColor,
        brightness,
      ];
}
