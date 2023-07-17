import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:note_app/feature/accessibility/domain/interfaces/accessibility_interfaces.dart';
import 'package:note_app/feature/note_catalog/domain/models/note_models.dart';

import '../../../../core/domain/errors/value_failure.dart';
import '../../../../core/domain/value_objects/value_object.dart';

class ThemeColorValueObject<T extends IAccessibilityValidator> extends ValueObject<Color> {
  factory ThemeColorValueObject({required Color color, required T validator}) {
    final Either<ValueFailure<Color>, Color> themeColorValidated = validator.validateThemeColor(color: color);

    return ThemeColorValueObject._(
        value: themeColorValidated
    );
  }

  const ThemeColorValueObject._({required super.value});
}