import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../value_objects/accessibility_value_objects.dart';
import '../entities/accessibility_entity.dart';
import '../interfaces/accessibility_interfaces.dart';
import '../../../../core/domain/errors/failure.dart';
import '../../../note_catalog/domain/models/note_priority_model.dart';

class AccessibilityFactory<T extends IAccessibilityValidator>
    implements IAccessibilityFactory<T> {
  @override
  final T validator;

  AccessibilityFactory({required this.validator});

  @override
  Future<Either<Failure, String>> convertAccessibilityToJsonString(
      {required AccessibilityEntity<T> entity}) {
    // TODO: implement convertAccessibilityToJsonString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>>
      getAccessibilityEntityFromJSONString({required String source}) {
    // TODO: implement getAccessibilityEntityFromJSONString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>>
      getDefaultAccessibilityEntity() async {
    try {
      const Brightness brightness = Brightness.dark;
      const Color themeColor = Colors.green;
      final priorityColor = {
        NotePriority.blocker: Colors.red.shade900,
        NotePriority.critical: Colors.red.shade600,
        NotePriority.major: Colors.redAccent,
        NotePriority.minor: Colors.blueAccent,
        NotePriority.trivial: Colors.green,
      };
      const double fontSize = 1.0;

      const bool isTextSelectable = true;

      return Right(
        AccessibilityEntity(
          isTextSelectable: isTextSelectable,
          brightness: brightness,
          themeColor:
              ThemeColorValueObject<T>(color: themeColor, validator: validator),
          priorityColor: PriorityColorValueObject<T>(
              priorityColor: priorityColor, validator: validator),
          fontSize: FontSizeValueObject<T>(
            validator: validator,
            fontSize: fontSize,
          ),
        ),
      );
    } on Exception catch (e) {
      return const Left(
        UnexpectedFailure(message: 'Accessibility initialization failed'),
      );
    }
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetBrightness(
      {required AccessibilityEntity<T> entity}) {
    // TODO: implement resetBrightness
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetFontSize(
      {required AccessibilityEntity<T> entity}) {
    // TODO: implement resetFontSize
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetPriorityColors(
      {required AccessibilityEntity<T> entity}) {
    // TODO: implement resetPriorityColors
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetThemeColor(
      {required AccessibilityEntity<T> entity}) {
    // TODO: implement resetThemeColor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setBrightness(
      {required Brightness brightness,
      required AccessibilityEntity<T> entity}) {
    // TODO: implement setBrightness
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setFontSize(
      {required double fontSize, required AccessibilityEntity<T> entity}) {
    // TODO: implement setFontSize
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setPriorityColor(
      {required Color color,
      required NotePriority priority,
      required AccessibilityEntity<T> entity}) {
    // TODO: implement setPriorityColor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setThemeColor(
      {required Color color, required AccessibilityEntity<T> entity}) {
    // TODO: implement setThemeColor
    throw UnimplementedError();
  }
}
