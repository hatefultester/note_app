import 'package:equatable/equatable.dart';
import 'value_objects/note_description.dart';
import 'value_objects/note_id.dart';
import 'value_objects/note_status.dart';
import 'value_objects/note_time_stamp.dart';
import 'value_objects/note_title.dart';

class Note extends Equatable {
  final NoteId id;
  final NoteDescription description;
  final NoteTitle title;
  final NoteTimeStamp timeStamp;
  final NoteStatus status;

  factory Note({
    required NoteId id,
    required NoteDescription description,
    required NoteTitle title,
    required NoteTimeStamp timeStamp,
    required NoteStatus status,
  }) {
    return Note._(
      id: id,
      description: description,
      title: title,
      timeStamp: timeStamp,
      status: status,
    );
  }

  factory Note.initial() {
    return Note._(
      id: NoteId.auto(),
      status: NoteStatus.initial(),
      description: NoteDescription.initial(),
      title: NoteTitle.initial(),
      timeStamp: NoteTimeStamp.initial(),
    );
  }

  factory Note.copyFrom({
    required Note originalNote,
    NoteStatus? status,
    NoteDescription? description,
    NoteTitle? title,
    NoteTimeStamp? timeStamp,
  }) {
    return Note(
      id: originalNote.id,
      status: status ?? originalNote.status,
      description: description ?? originalNote.description,
      title: title ?? originalNote.title,
      timeStamp: timeStamp ?? originalNote.timeStamp,
    );
  }

  const Note._({
    required this.id,
    required this.status,
    required this.description,
    required this.title,
    required this.timeStamp,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        title,
        timeStamp,
        status,
      ];
}
