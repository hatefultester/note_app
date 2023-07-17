import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'note_priority_model.dart';

class NoteStatusModel extends Equatable {
  final bool isNoteFinished;
  final NotePriority priority;
  final Option<DateTime> dueDate;

  const NoteStatusModel({
    required this.isNoteFinished,
    required this.dueDate,
    required this.priority,
  });

  @override
  List<Object?> get props => [isNoteFinished, priority, dueDate];
}
