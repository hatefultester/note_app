import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/failure.dart';
import '../../../../core/infrastructure/mixins/shared_preferences_mixin.dart';

import '../../domain/interfaces/i_accessibility_persistence.dart';

class AccessibilityPersistence
    with SharedPreferencesMixin
    implements IAccessibilityPersistence {
  final String _key = 'AccessibilityPersistenceEntityKey';

  @override
  Future<Either<Failure, Unit>> clear() async {
    return await removeValueFromPersistence(key: _key);
  }

  @override
  Future<Either<Failure, String>>
      getAccessibilityFromPersistenceAsJSONString() async {
    return await getValueFromPersistence(key: _key);
  }

  @override
  Future<Either<Failure, Unit>> storeAccessibilityToPersistence(
      {required String jsonString}) async {
    return await storeValueToPersistence(key: _key, value: jsonString);
  }
}
