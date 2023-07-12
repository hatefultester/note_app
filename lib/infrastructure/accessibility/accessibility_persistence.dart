import 'package:dartz/dartz.dart';

import 'package:note_app/domain/core/error/failure.dart';
import 'package:note_app/infrastructure/core/mixin/shared_preferences_mixin.dart';

import '../../domain/accessibility/interfaces/i_accessibility_persistence.dart';

class AccessibilityPersistence with SharedPreferencesMixin implements IAccessibilityPersistence  {
  @override
  Future<Either<Failure, Unit>> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getAccessibilityFromPersistenceAsJSONString() {
    // TODO: implement getAccessibilityFromPersistenceAsJSONString
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeAccessibilityToPersistence({required String jsonString}) {
    // TODO: implement storeAccessibilityToPersistence
    throw UnimplementedError();
  }

}