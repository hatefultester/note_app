import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/error/failure.dart';
import '../../../domain/note/interfaces/i_note_persistence.dart';

class NotePersistence implements INotePersistence {
  final Future<SharedPreferences> _preferencesFuture =
      SharedPreferences.getInstance();
  final String _key = 'notes';

  @override
  Future<Either<Failure, Unit>> clear() async {
    final prefs = await _preferencesFuture;
    final bool result = await prefs.remove(
      _key,
    );
    if (result) {
      return const Right(
        unit,
      );
    } else {
      return const Left(
        StoringFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, String>> getNotesFromPersistenceAsJSONString() async {
    final prefs = await _preferencesFuture;
    final Option<String> source = optionOf(
      prefs.getString(_key),
    );
    return source.fold(
      () => const Left(NoDataFoundFailure()),
      (a) => Right(a),
    );
  }

  @override
  Future<Either<Failure, Unit>> storeNotesToPersistence(
      {required String jsonString}) async {
    final prefs = await _preferencesFuture;
    final bool result = await prefs.setString(_key, jsonString);
    if (result) {
      return const Right(
        unit,
      );
    } else {
      return const Left(
        StoringFailure(),
      );
    }
  }
}
