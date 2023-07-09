import 'package:equatable/equatable.dart';
import 'enums/note_priority.dart';

class NoteStatusModel extends Equatable {
  final bool isNoteFinished;
  final NotePriority priority;
  final DateTime? dueDate;

  const NoteStatusModel({
    required this.isNoteFinished,
    this.dueDate,
    required this.priority,
  });

  @override
  List<Object?> get props => [isNoteFinished, priority, dueDate];
}
