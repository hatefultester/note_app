import 'dart:ui';

import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../note/model/note_models.dart';
import '../entity/accessibility_entity.dart';
import 'accessibility_interfaces.dart';

abstract class IAccessibilityFactory<T extends IAccessibilityValidator> {
  final T validator;

  IAccessibilityFactory({
    required this.validator,
  });

  Future<Either<Failure, String>> convertAccessibilityToJsonString({
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>>
      getAccessibilityEntityFromJSONString({
    required String source,
  });

  Future<Either<Failure, AccessibilityEntity<T>>>
      getDefaultAccessibilityEntity();

  Future<Either<Failure, AccessibilityEntity<T>>> resetBrightness({
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> resetFontSize({
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> resetPriorityColors({
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> resetThemeColor({
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> setBrightness({
    required Brightness brightness,
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> setFontSize({
    required double fontSize,
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> setPriorityColor({
    required Color color,
    required NotePriority priority,
    required AccessibilityEntity<T> entity,
  });

  Future<Either<Failure, AccessibilityEntity<T>>> setThemeColor({
    required Color color,
    required AccessibilityEntity<T> entity,
  });
}
