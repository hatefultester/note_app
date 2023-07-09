import 'package:equatable/equatable.dart';

import '../objects/note_description.dart';
import '../objects/note_status.dart';
import '../objects/note_time_stamp.dart';
import '../objects/note_title.dart';

class Note extends Equatable {
  final int id;
  final NoteDescription description;
  final NoteTitle title;
  final NoteTimeStamp timeStamp;
  final NoteStatus status;

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
