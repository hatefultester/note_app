import 'package:equatable/equatable.dart';
import 'value_objects/note_description.dart';
import 'value_objects/note_status.dart';
import 'value_objects/note_time_stamp.dart';
import 'value_objects/note_title.dart';

class Note extends Equatable {
  final String id;
  final NoteDescription description;
  final NoteTitle title;
  final NoteTimeStamp timeStamp;
  final NoteStatus status;

  factory Note.create({required String id}) {
    return Note._(
      id: id,
      status: NoteStatus.initial(),
      description: NoteDescription.initial(),
      title: NoteTitle.initial(),
      timeStamp: NoteTimeStamp.initial(),
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
        description,
        title,
        timeStamp,
        status,
      ];
}
