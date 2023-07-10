import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/note.dart';
import '../../../domain/entities/value_objects/note_description.dart';
import '../../../domain/entities/value_objects/note_status.dart';
import '../../../domain/entities/value_objects/note_title.dart';
import '../../../domain/model/enums/note_priority.dart';
import '../../../domain/model/note_status.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Logger logger;

  NoteBloc(this.logger)
      : super(
          NoteInitial(),
        ) {
    on<NewNoteStarted>(_handleNewNoteStarted);
    on<EditNoteStarted>(_handleEditNoteStarted);
    on<NoteExitClicked>(_handleNoteExitClicked);
    on<NoteExitDismissClicked>(_handleNoteExitDismissClicked);
    on<NoteExitConfirmClicked>(_handleNoteExitConfirmClicked);
    on<NoteSaveClicked>(_handleNoteSaveClicked);
    on<NoteSaveDismissClicked>(_handleNoteSaveDismissClicked);
    on<NoteSaveConfirmClicked>(_handleNoteSaveConfirmClicked);
    on<CancelEditClicked>(_handleCancelEditClicked);
    on<CancelEditConfirmClicked>(_handleCancelEditConfirmClicked);
    on<CancelEditDismissClicked>(_handleCancelEditDismissClicked);
    on<RemoveDueDateClicked>(_handleRemoveDueDateClicked);
    on<RemoveDueDateDismissClicked>(_handleRemoveDueDateDismissClicked);
    on<RemoveDueDateConfirmClicked>(_handleRemoveDueDateConfirmClicked);
    on<NoteDescriptionChanged>(_handleNoteDescriptionChanged);
    on<NoteTitleChanged>(_handleNoteTitleChanged);
    on<NotePriorityChanged>(_handleNotePriorityChanged);
    on<NoteFinishedStatusChanged>(_handleNoteFinishedStatusChanged);
    on<NoteDueDateChanged>(_handleNoteDueDateChanged);
  }

  FutureOr<void> _handleCancelEditClicked(
    CancelEditClicked event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final bool isDialogStatusOpened = currentState.showRestoreDialog;

      if (isDialogStatusOpened) {
        return;
      }

      emit(
        currentState.copyWith(showRestoreDialog: true),
      );

      logger.i('Cancel edit clicked handled');
    } catch (e) {
      logger.e('Cancel edit clicked failed with exception: $e');
      emit(
        const NoteError(errorMessage: 'Cancel edit failed'),
      );
    }
  }

  FutureOr<void> _handleCancelEditConfirmClicked(
    CancelEditConfirmClicked event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final Note originalNote = currentState.originalNote;
      final bool isDialogStatusOpened = currentState.showRestoreDialog;

      if (!isDialogStatusOpened) {
        return;
      }

      emit(
        currentState.copyWith(
          showRestoreDialog: false,
          note: originalNote,
        ),
      );

      logger.i('Cancel edit confirmed handled');
    } catch (e) {
      logger.e('Cancel edit confirm failed with exception: $e');
      emit(
        const NoteError(errorMessage: 'Cancel edit failed'),
      );
    }
  }

  FutureOr<void> _handleCancelEditDismissClicked(
    CancelEditDismissClicked event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final bool isDialogStatusOpened = currentState.showRestoreDialog;

      if (!isDialogStatusOpened) {
        return;
      }

      emit(
        currentState.copyWith(showRestoreDialog: false),
      );

      logger.i('Cancel edit handled');
    } catch (e) {
      logger.e('Cancel edit clicked failed with exception: $e');
      emit(
        const NoteError(errorMessage: 'Cancel edit failed'),
      );
    }
  }

  FutureOr<void> _handleEditNoteStarted(
    EditNoteStarted event,
    Emitter<NoteState> emit,
  ) async {
    try {
      emit(NoteLoading());
      final Note note = event.value;
      await _userExperienceDelay();
      emit(
        NoteLoaded(
          originalNote: note,
          note: note,
          showRestoreDialog: false,
          showExitConfirmationDialog: false,
        ),
      );
      logger.i('Note was loaded correctly, note: ${note.toString()}');
    } on Exception catch (e) {
      logger.e('Note loading failed with exception: $e');
      emit(
        const NoteError(
          errorMessage: 'Note loading failed',
        ),
      );
    }
  }

  FutureOr<void> _handleNewNoteStarted(
    NewNoteStarted event,
    Emitter<NoteState> emit,
  ) async {
    try {
      emit(NoteLoading());
      final Note note = Note.initial();
      await _userExperienceDelay();
      emit(
        NoteLoaded(
          originalNote: note,
          note: note,
          showRestoreDialog: false,
          showExitConfirmationDialog: false,
        ),
      );
      logger.i('Note was loaded correctly, note: ${note.toString()}');
    } on Exception catch (e) {
      logger.e('Note loading failed with exception: $e');
      emit(
        const NoteError(
          errorMessage: 'Note loading failed',
        ),
      );
    }
  }

  FutureOr<void> _handleNoteDescriptionChanged(
    NoteDescriptionChanged event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final Note currentNote = currentState.note;
      final String noteDescriptionValue =
          currentNote.description.value.fold((l) => l.value, (r) => r);
      final String newNoteDescriptionValue = event.value;
      final bool areDescriptionValuesSame =
          noteDescriptionValue == newNoteDescriptionValue;

      if (areDescriptionValuesSame) {
        return;
      }

      final NoteDescription newNoteDescription =
          NoteDescription(description: newNoteDescriptionValue);

      emit(
        currentState.copyWith(
          note: Note.copyFrom(
              originalNote: currentNote, description: newNoteDescription),
        ),
      );
      logger.i('note description changed to ${newNoteDescription.toString()}');
    } on Exception catch (e) {
      logger.e('note description change failed with exception $e');
      emit(
        const NoteError(
          errorMessage: 'Changing note description failed',
        ),
      );
    }
  }

  FutureOr<void> _handleNoteDueDateChanged(
    NoteDueDateChanged event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteExitClicked(
    NoteExitClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteExitConfirmClicked(
    NoteExitConfirmClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteExitDismissClicked(
    NoteExitDismissClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteFinishedStatusChanged(
    NoteFinishedStatusChanged event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final Note currentNote = currentState.note;
      final NoteStatusModel noteStatus =
          currentNote.status.value.fold((l) => l.value, (r) => r);

      final bool noteFinishedStatus = noteStatus.isNoteFinished;
      final bool noteFinishedNewStatus = event.value;
      final bool areNoteStatusesSame =
          noteFinishedStatus == noteFinishedNewStatus;

      if (areNoteStatusesSame) {
        return;
      }

      final NoteStatus newNoteStatus = NoteStatus(
        model: NoteStatusModel(
          isNoteFinished: noteFinishedNewStatus,
          priority: noteStatus.priority,
        ),
      );

      emit(
        currentState.copyWith(
          note: Note.copyFrom(originalNote: currentNote, status: newNoteStatus),
        ),
      );
      logger.i('note status changed to ${newNoteStatus.toString()}');
    } on Exception catch (e) {
      logger.e('note status changing failed with exception: $e');
      emit(
        const NoteError(
          errorMessage: 'Changing note status failed',
        ),
      );
    }
  }

  FutureOr<void> _handleNotePriorityChanged(
    NotePriorityChanged event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final Note currentNote = currentState.note;
      final NoteStatusModel noteStatus =
          currentNote.status.value.fold((l) => l.value, (r) => r);

      final NotePriority notePriority = noteStatus.priority;
      final NotePriority noteNewPriority = event.value;
      final bool arePrioritiesSame = notePriority == noteNewPriority;

      if (arePrioritiesSame) {
        return;
      }

      final NoteStatus newNoteStatus = NoteStatus(
        model: NoteStatusModel(
          isNoteFinished: noteStatus.isNoteFinished,
          priority: noteNewPriority,
        ),
      );

      emit(
        currentState.copyWith(
          note: Note.copyFrom(originalNote: currentNote, status: newNoteStatus),
        ),
      );
      logger.i('note status changed to ${newNoteStatus.toString()}');
    } on Exception catch (e) {
      logger.e('note status changing failed with exception: $e');
      emit(
        const NoteError(
          errorMessage: 'Changing note priority failed',
        ),
      );
    }
  }

  FutureOr<void> _handleNoteSaveClicked(
    NoteSaveClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteSaveConfirmClicked(
    NoteSaveConfirmClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteSaveDismissClicked(
    NoteSaveDismissClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleNoteTitleChanged(
    NoteTitleChanged event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final NoteLoaded currentState = state as NoteLoaded;
      final Note currentNote = currentState.note;
      final String noteTitleValue =
          currentNote.title.value.fold((l) => l.value, (r) => r);
      final String newNoteTitleValue = event.value;
      final bool areTitleValuesSame = noteTitleValue == newNoteTitleValue;

      if (areTitleValuesSame) {
        return;
      }

      final NoteTitle newNoteTitle = NoteTitle(title: newNoteTitleValue);

      emit(
        currentState.copyWith(
          note: Note.copyFrom(originalNote: currentNote, title: newNoteTitle),
        ),
      );
      logger.i('note title changed to ${newNoteTitle.toString()}');
    } on Exception catch (e) {
      logger.e('note title change failed with exception $e');
      emit(
        const NoteError(
          errorMessage: 'Changing note title failed',
        ),
      );
    }
  }

  FutureOr<void> _handleRemoveDueDateClicked(
    RemoveDueDateClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleRemoveDueDateConfirmClicked(
    RemoveDueDateConfirmClicked event,
    Emitter<NoteState> emit,
  ) async {}

  FutureOr<void> _handleRemoveDueDateDismissClicked(
    RemoveDueDateDismissClicked event,
    Emitter<NoteState> emit,
  ) async {}

  _userExperienceDelay() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
  }
}
