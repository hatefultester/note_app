import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/error/failure.dart';

mixin SharedPreferencesMixin {
  final Future<SharedPreferences> _preferencesFuture =
      SharedPreferences.getInstance();

  Future<Either<Failure, String>> getValueFromPersistence({
    required String key,
  }) async {
    final prefs = await _preferencesFuture;
    final Option<String> result = optionOf(
      prefs.getString(
        key,
      ),
    );
    return result.fold(
      () => const Left(
        NoDataFoundFailure(),
      ),
      (a) => Right(a),
    );
  }

  Future<Either<Failure, Unit>> storeValueToPersistence({
    required String key,
    required String value,
  }) async {
    final prefs = await _preferencesFuture;
    final bool result = await prefs.setString(
      key,
      value,
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

  Future<Either<Failure, Unit>> removeValueFromPersistence(
      {required String key}) async {
    final prefs = await _preferencesFuture;
    final bool result = await prefs.remove(
      key,
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
}
