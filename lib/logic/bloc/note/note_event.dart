
import 'package:dartz/dartz.dart';

import '../../../domain/feature/note/entity/note_entity.dart';

sealed class NoteEvent {}

abstract class NoteChangedEvent<T> extends NoteEvent {
  final T value;

  NoteChangedEvent({required this.value});
}


final class NewNoteStarted extends NoteChangedEvent<Option<NoteEntity>> {
  NewNoteStarted({required super.value});
}

final class NoteDescriptionEdited extends NoteChangedEvent<String> {
  NoteDescriptionEdited({required super.value});
}

final class NoteTitleEdited extends NoteChangedEvent<String> {
  NoteTitleEdited({required super.value});
}

final class NotePriorityEdited extends NoteChangedEvent<String> {
  NotePriorityEdited({required super.value});
}

final class NoteDueDateEdited extends NoteChangedEvent<Option<DateTime>> {
  NoteDueDateEdited({required super.value});
}

final class NoteFinishedStatusEdited extends NoteChangedEvent<bool> {
  NoteFinishedStatusEdited({required super.value});
}