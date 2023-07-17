import 'package:dartz/dartz.dart';
import '../../../../core/infrastructure/mixins/shared_preferences_mixin.dart';

import '../../../../core/domain/errors/failure.dart';
import '../../domain/interfaces/i_note_persistence.dart';

class NotePersistence with SharedPreferencesMixin implements INotePersistence {
  final String _key = 'notes';

  @override
  Future<Either<Failure, Unit>> clear() async {
    return await removeValueFromPersistence(
      key: _key,
    );
  }

  @override
  Future<Either<Failure, String>> getNotesFromPersistenceAsJSONString() async {
    return await getValueFromPersistence(
      key: _key,
    );
  }

  @override
  Future<Either<Failure, Unit>> storeNotesToPersistence(
      {required String jsonString}) async {
    return await storeValueToPersistence(
      key: _key,
      value: jsonString,
    );
  }
}
