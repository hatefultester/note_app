import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../interfaces/i_note_validator.dart';

import '../objects/note_value_objects.dart';

class NoteEntity<T extends INoteValidator> extends Equatable {
  final String id;
  final NoteDescriptionValueObject<T> description;
  final NoteTitleValueObject<T> title;
  final NoteTimeStampValueObject<T> timeStamp;
  final NoteStatusValueObject<T> status;

  factory NoteEntity({
    required String id,
    required NoteDescriptionValueObject<T> description,
    required NoteTitleValueObject<T> title,
    required NoteTimeStampValueObject<T> timeStamp,
    required NoteStatusValueObject<T> status,
  }) {
    return NoteEntity._(
      id: id,
      description: description,
      title: title,
      timeStamp: timeStamp,
      status: status,
    );
  }

  factory NoteEntity.copyFrom({
    required NoteEntity<T> originalNote,
    NoteStatusValueObject<T>? status,
    NoteDescriptionValueObject<T>? description,
    NoteTitleValueObject<T>? title,
    NoteTimeStampValueObject<T>? timeStamp,
  }) {
    return NoteEntity(
      id: originalNote.id,
      status: status ?? originalNote.status,
      description: description ?? originalNote.description,
      title: title ?? originalNote.title,
      timeStamp: timeStamp ?? originalNote.timeStamp,
    );
  }

  const NoteEntity._({
    required this.id,
    required this.status,
    required this.description,
    required this.title,
    required this.timeStamp,
  });

  @override
  List<Object?> get props =>
      [
        id,
        description,
        title,
        timeStamp,
        status,
      ];
}
