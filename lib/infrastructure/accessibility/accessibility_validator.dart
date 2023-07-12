import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';
import 'package:note_app/domain/core/error/value_failure.dart';
import 'package:note_app/domain/note/model/note_priority_model.dart';

class AccessibilityValidator implements IAccessibilityValidator {
  @override
  Either<ValueFailure<double>, double> validateFontSize({required double fontSize}) {
    // TODO: implement validateFontSize
    throw UnimplementedError();
  }

  @override
  Either<ValueFailure<Map<NotePriority, Color>>, Map<NotePriority, Color>> validatePriorityColor({required Map<NotePriority, Color> priorityColor}) {
    // TODO: implement validatePriorityColor
    throw UnimplementedError();
  }

  @override
  Either<ValueFailure<Color>, Color> validateThemeColor({required Color color}) {
    // TODO: implement validateThemeColor
    throw UnimplementedError();
  }
}