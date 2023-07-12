import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';
import 'package:note_app/domain/note/model/note_models.dart';

import '../../core/error/value_failure.dart';
import '../../core/objects/value_object.dart';

class PriorityColorValueObject<T extends IAccessibilityValidator> extends ValueObject<Map<NotePriority, Color>> {
  factory PriorityColorValueObject({required Map<NotePriority, Color> priorityColor, required T validator}) {
    final Either<ValueFailure<Map<NotePriority, Color>>, Map<NotePriority, Color>> priorityColorValidated = validator.validatePriorityColor(priorityColor: priorityColor);

    return PriorityColorValueObject._(
        value: priorityColorValidated
    );
  }

  const PriorityColorValueObject._({required super.value});
}