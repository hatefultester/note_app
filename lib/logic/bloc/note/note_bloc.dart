import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../core/validators/enum_helper.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/value_failure.dart';
import '../../../domain/feature/note/entity/note_entity.dart';
import '../../../domain/feature/note/model/note_priority_model.dart';
import '../../../domain/feature/note/repository/note_repository.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Logger _logger;
  final NoteRepository _repository;

  NoteBloc(this._repository)
      : _logger = Logger(),
        super(
          NoteInitial(),
        ) {
    on<NewNoteStarted>(_handleNewNoteStarted);
    on<NoteDescriptionEdited>(_handleNoteDescriptionEdited);
    on<NoteTitleEdited>(_handleNoteTitleEdited);
    on<NotePriorityEdited>(_handleNotePriorityEdited);
    on<NoteDueDateEdited>(_handleNoteDueDateEdited);
    on<NoteFinishedStatusEdited>(_handleNoteFinishedStatusEdited);
  }

  FutureOr<void> _handleNewNoteStarted(
      NewNoteStarted event, Emitter<NoteState> emit) async {
    event.value.fold(() async {
      final Either<Failure, NoteEntity> entityResult =
          await _repository.factory.createNewNote();

      entityResult.fold(
        (l) {
          _logger.e(l.message);
          emit(
            const NoteError(errorMessage: 'Loading failed'),
          );
        },
        (r) => emit(
          NoteLoaded(originalNote: r, note: r),
        ),
      );
    }, (a) {
      emit(
        NoteLoaded(originalNote: a, note: a),
      );
    });
  }

  FutureOr<void> _handleNoteDescriptionEdited(
      NoteDescriptionEdited event, Emitter<NoteState> emit) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final NoteEntity currentEntity = currentState.note;
      final Either<Failure, NoteEntity> newEntityResult =
          await _repository.factory.setDescription(
        description: event.value,
        entity: currentEntity,
      );

      newEntityResult.fold(
        (l) {
          _logger.e(l.message);
          emit(
            const NoteError(errorMessage: 'note description edit failed'),
          );
        },
        (r) => emit(
          NoteLoaded(
            originalNote: currentEntity,
            note: r,
          ),
        ),
      );
    } on Exception catch (e) {
      _logger.e(e);
      emit(
        const NoteError(
            errorMessage: 'note description edit failed unexpectedly'),
      );
    }
  }

  FutureOr<void> _handleNoteTitleEdited(
      NoteTitleEdited event, Emitter<NoteState> emit) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final NoteEntity currentEntity = currentState.note;
      final Either<Failure, NoteEntity> newEntityResult =
          await _repository.factory.setTitle(
        title: event.value,
        entity: currentEntity,
      );

      newEntityResult.fold(
        (l) {
          _logger.e(l.message);
          emit(
            const NoteError(errorMessage: 'note title edit failed'),
          );
        },
        (r) => emit(
          NoteLoaded(
            originalNote: currentEntity,
            note: r,
          ),
        ),
      );
    } on Exception catch (e) {
      _logger.e(e);
      emit(
        const NoteError(errorMessage: 'note title edit failed unexpectedly'),
      );
    }
  }

  FutureOr<void> _handleNotePriorityEdited(
      NotePriorityEdited event, Emitter<NoteState> emit) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final NoteEntity currentEntity = currentState.note;
      final Either<ValueFailure<String>, NotePriority> notePriority =
          EnumHelper.enumFromString<NotePriority>(
        NotePriority.values,
        event.value,
      );

      notePriority.fold((l) async {
        _logger.e(l.message);
        emit(
          const NoteError(errorMessage: 'Parsing note priority failed'),
        );
      }, (r) async {
        final Either<Failure, NoteEntity> newEntityResult =
            await _repository.factory.setPriority(
          priority: r,
          entity: currentEntity,
        );

        newEntityResult.fold(
          (l) {
            _logger.e(l.message);
            emit(
              const NoteError(errorMessage: 'note priority edit failed'),
            );
          },
          (r) => emit(
            NoteLoaded(
              originalNote: currentEntity,
              note: r,
            ),
          ),
        );
      });
    } on Exception catch (e) {
      _logger.e(e);
      emit(
        const NoteError(errorMessage: 'note priority edit failed unexpectedly'),
      );
    }
  }

  FutureOr<void> _handleNoteDueDateEdited(
      NoteDueDateEdited event, Emitter<NoteState> emit) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final NoteEntity currentEntity = currentState.note;
      final Either<Failure, NoteEntity> newEntityResult =
          await _repository.factory.setDueDate(
        entity: currentEntity,
        dueDate: event.value,
      );

      newEntityResult.fold(
        (l) {
          _logger.e(l.message);
          emit(
            const NoteError(errorMessage: 'note due date edit failed'),
          );
        },
        (r) => emit(
          NoteLoaded(
            originalNote: currentEntity,
            note: r,
          ),
        ),
      );
    } on Exception catch (e) {
      _logger.e(e);
      emit(
        const NoteError(errorMessage: 'note due date edit failed unexpectedly'),
      );
    }
  }

  FutureOr<void> _handleNoteFinishedStatusEdited(
      NoteFinishedStatusEdited event, Emitter<NoteState> emit) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final NoteEntity currentEntity = currentState.note;
      final Either<Failure, NoteEntity> newEntityResult =
          await _repository.factory.setFinishedStatus(
        entity: currentEntity,
        isFinished: event.value,
      );

      newEntityResult.fold(
        (l) {
          _logger.e(l.message);
          emit(
            const NoteError(errorMessage: 'note finished status edit failed'),
          );
        },
        (r) => emit(
          NoteLoaded(
            originalNote: currentEntity,
            note: r,
          ),
        ),
      );
    } on Exception catch (e) {
      _logger.e(e);
      emit(
        const NoteError(
            errorMessage: 'note finished status edit failed unexpectedly'),
      );
    }
  }
}
