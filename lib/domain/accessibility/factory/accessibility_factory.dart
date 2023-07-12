import 'dart:ui';

import 'package:dartz/dartz.dart';
import '../entity/accessibility_entity.dart';
import '../interfaces/accessibility_interfaces.dart';
import '../../core/error/failure.dart';
import '../../note/model/note_priority_model.dart';

class AccessibilityFactory<T extends IAccessibilityValidator> implements IAccessibilityFactory<T> {
  @override
  final T validator;

  AccessibilityFactory({required this.validator});

  @override
  Future<Either<Failure, String>> convertAccessibilityToJsonString({required AccessibilityEntity<T> entity}) {
    // TODO: implement convertAccessibilityToJsonString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> getAccessibilityEntityFromJSONString({required String source}) {
    // TODO: implement getAccessibilityEntityFromJSONString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> getDefaultAccessibilityEntity() {
    // TODO: implement getDefaultAccessibilityEntity
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetBrightness({required AccessibilityEntity<T> entity}) {
    // TODO: implement resetBrightness
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetFontSize({required AccessibilityEntity<T> entity}) {
    // TODO: implement resetFontSize
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetPriorityColors({required AccessibilityEntity<T> entity}) {
    // TODO: implement resetPriorityColors
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> resetThemeColor({required AccessibilityEntity<T> entity}) {
    // TODO: implement resetThemeColor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setBrightness({required Brightness brightness, required AccessibilityEntity<T> entity}) {
    // TODO: implement setBrightness
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setFontSize({required double fontSize, required AccessibilityEntity<T> entity}) {
    // TODO: implement setFontSize
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setPriorityColor({required Color color, required NotePriority priority, required AccessibilityEntity<T> entity}) {
    // TODO: implement setPriorityColor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccessibilityEntity<T>>> setThemeColor({required Color color, required AccessibilityEntity<T> entity}) {
    // TODO: implement setThemeColor
    throw UnimplementedError();
  }

}