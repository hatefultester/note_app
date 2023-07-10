import 'package:equatable/equatable.dart';

import '../../../domain/entities/note.dart';
import 'note_event.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props;
}

abstract class NoteSingletonState extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteSingletonState {}

class NoteLoading extends NoteSingletonState {}

class NoteLoaded extends NoteState {
  final Note note;
  final Note originalNote;
  final bool showExitConfirmationDialog;
  final bool showRestoreDialog;

  const NoteLoaded({
    required this.originalNote,
    required this.note,
    this.showExitConfirmationDialog = false,
    this.showRestoreDialog = false,
  });

  NoteLoaded copyWith({
    bool? showRestoreDialog,
    bool? showExitConfirmationDialog,
    Note? note,
  }) {
    return NoteLoaded(
      originalNote: originalNote,
      note: note ?? this.note,
      showExitConfirmationDialog:
          showExitConfirmationDialog ?? this.showExitConfirmationDialog,
      showRestoreDialog: showRestoreDialog ?? this.showRestoreDialog,
    );
  }

  @override
  List<Object?> get props => [note];
}

class NoteError extends NoteState {
  final String errorMessage;

  const NoteError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
