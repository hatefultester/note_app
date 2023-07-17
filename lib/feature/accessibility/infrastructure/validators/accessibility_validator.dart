import 'dart:ui';

import 'package:dartz/dartz.dart';
import '../../domain/interfaces/accessibility_interfaces.dart';
import '../../../../core/domain/errors/value_failure.dart';
import '../../../note_catalog/domain/models/note_priority_model.dart';

class AccessibilityValidator implements IAccessibilityValidator {
  @override
  Either<ValueFailure<double>, double> validateFontSize(
      {required double fontSize}) {
    switch (fontSize) {
      case (0.6):
      case (0.8):
      case (1):
      case (1.2):
      case (1.4):
        return Right(fontSize);
      default:
        return Left(InvalidFontSize(value: fontSize));
    }
  }

  @override
  Either<ValueFailure<Map<NotePriority, Color>>, Map<NotePriority, Color>>
      validatePriorityColor({required Map<NotePriority, Color> priorityColor}) {
    Option<ValueFailure<Map<NotePriority, Color>>> optionalFailure = none();
    List<Color> colors = [];

    priorityColor.forEach((key, value) {
      if (optionalFailure.isSome()) {
        return;
      }
      if (colors.contains(value)) {
        optionalFailure = optionOf(
          InvalidColorPatternSelection(value: priorityColor),
        );
        return;
      }
      optionalFailure = _isColorValid(
        color: value,
      );
    });

    return optionalFailure.fold(
      () => Right(
        priorityColor,
      ),
      (a) => Left(a),
    );
  }

  @override
  Either<ValueFailure<Color>, Color> validateThemeColor(
      {required Color color}) {
    return Right(color);
  }

  Option<ValueFailure<Map<NotePriority, Color>>> _isColorValid(
      {required Color color}) {
    return none();
  }
}
