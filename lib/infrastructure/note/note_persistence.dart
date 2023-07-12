import 'package:dartz/dartz.dart';
import '../core/mixin/shared_preferences_mixin.dart';

import '../../domain/core/error/failure.dart';
import '../../domain/note/interfaces/i_note_persistence.dart';

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
