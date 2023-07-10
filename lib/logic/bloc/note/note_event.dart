
import '../../../domain/entities/note.dart';
import '../../../domain/model/enums/note_priority.dart';

sealed class NoteEvent {}

abstract class NoteChangedEvent<T> extends NoteEvent {
  final T value;

  NoteChangedEvent({required this.value});
}

/// on start events

final class NewNoteStarted extends NoteEvent {}

final class EditNoteStarted extends NoteChangedEvent<Note> {
  EditNoteStarted({required super.value});
}

/// button taps events

final class NoteExitClicked extends NoteEvent {}

final class NoteExitConfirmClicked extends NoteEvent {}

final class NoteExitDismissClicked extends NoteEvent {}

final class NoteSaveClicked extends NoteEvent {}

final class NoteSaveConfirmClicked extends NoteEvent {}

final class NoteSaveDismissClicked extends NoteEvent {}

final class CancelEditClicked extends NoteEvent {}

final class CancelEditConfirmClicked extends NoteEvent {}

final class CancelEditDismissClicked extends NoteEvent {}

final class RemoveDueDateClicked extends NoteEvent {}

final class RemoveDueDateDismissClicked extends NoteEvent {}

final class RemoveDueDateConfirmClicked extends NoteEvent {}

/// edit events

final class NoteDescriptionChanged extends NoteChangedEvent<String> {
  NoteDescriptionChanged({required super.value});
}

final class NoteTitleChanged extends NoteChangedEvent<String> {
  NoteTitleChanged({required super.value});
}

final class NotePriorityChanged extends NoteChangedEvent<NotePriority> {
  NotePriorityChanged({required super.value});
}

final class NoteFinishedStatusChanged extends NoteChangedEvent<bool> {
  NoteFinishedStatusChanged({required super.value});
}

final class NoteDueDateChanged extends NoteChangedEvent<DateTime> {
  NoteDueDateChanged({required super.value});
}
