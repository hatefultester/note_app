import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/note/entity/note_entity.dart';

const Option<String> _noneOption = None();

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
  final NoteEntity note;
  final NoteEntity originalNote;
  final Option<String> snackBarMessageOption;

  const NoteLoaded({
    required this.originalNote,
    required this.note,
    this.snackBarMessageOption = _noneOption,
  });

  NoteLoaded copyWith({
    String? snackBarMessage,
    NoteEntity? note,
  }) {
    return NoteLoaded(
      originalNote: originalNote,
      note: note ?? this.note,
      snackBarMessageOption: optionOf(snackBarMessage),
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
