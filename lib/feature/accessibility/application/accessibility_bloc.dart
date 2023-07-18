import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../core/domain/errors/failure.dart';
import '../infrastructure/repositories/accessibility_repository.dart';
import '../domain/entities/accessibility_entity.dart';
import '../../note_catalog/domain/models/note_priority_model.dart';

part 'accessibility_event.dart';

part 'accessibility_state.dart';

class AccessibilityBloc extends Bloc<AccessibilityEvent, AccessibilityState> {
  final Logger _logger;
  final AccessibilityRepository _repository;

  AccessibilityBloc(this._repository)
      : _logger = Logger(),
        super(
          AccessibilityInitial(),
        ) {
    on<StartAccessibility>(_handleStartAccessibility);
    on<RestoreAccessibility>(_handleRestoreAccessibility);
    on<ChangeFontSize>(_handleChangeFontSize);
    on<ChangePriorityColor>(_handleChangePriorityColor);
    on<ChangeThemeColor>(_handleChangeThemeColor);
    on<SwitchThemeMode>(_handleSwitchThemeMode);
  }

  FutureOr<void> _handleStartAccessibility(
      StartAccessibility event, Emitter<AccessibilityState> emit) async {
    emit(AccessibilityLoading());
    final Either<Failure, AccessibilityEntity> entity =
        await _repository.factory.getDefaultAccessibilityEntity();

    entity.fold(
      (l) => emit(
        AccessibilityError(
          message: l.message,
        ),
      ),
      (r) => emit(
        AccessibilityLoaded(entity: r),
      ),
    );
  }

  FutureOr<void> _handleRestoreAccessibility(
      RestoreAccessibility event, Emitter<AccessibilityState> emit) async {}

  FutureOr<void> _handleChangeFontSize(
      ChangeFontSize event, Emitter<AccessibilityState> emit) async {}

  FutureOr<void> _handleChangePriorityColor(
      ChangePriorityColor event, Emitter<AccessibilityState> emit) async {}

  FutureOr<void> _handleChangeThemeColor(
      ChangeThemeColor event, Emitter<AccessibilityState> emit) async {
    // final repositoryResult = await _repository.factory.setThemeColor(color: color, entity: entity)
  }

  FutureOr<void> _handleSwitchThemeMode(
      SwitchThemeMode event, Emitter<AccessibilityState> emit) async {}
}
