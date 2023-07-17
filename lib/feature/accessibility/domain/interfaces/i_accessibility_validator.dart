import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:note_app/core/domain/core.dart';

import '../../../note_catalog/domain/models/note_priority_model.dart';

abstract class IAccessibilityValidator {
  Either<ValueFailure<Map<NotePriority, Color>>, Map<NotePriority, Color>>
      validatePriorityColor({required Map<NotePriority, Color> priorityColor});

  Either<ValueFailure<double>, double> validateFontSize(
      {required double fontSize});

  Either<ValueFailure<Color>, Color> validateThemeColor({required Color color});
}
