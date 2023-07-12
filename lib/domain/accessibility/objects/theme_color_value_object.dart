import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';
import 'package:note_app/domain/note/model/note_models.dart';

import '../../core/error/value_failure.dart';
import '../../core/objects/value_object.dart';

class ThemeColorValueObject<T extends IAccessibilityValidator> extends ValueObject<Color> {
  factory ThemeColorValueObject({required Color color, required T validator}) {
    final Either<ValueFailure<Color>, Color> themeColorValidated = validator.validateThemeColor(color: color);

    return ThemeColorValueObject._(
        value: themeColorValidated
    );
  }

  const ThemeColorValueObject._({required super.value});
}