import 'package:dartz/dartz.dart';

import '../../business_rules/note_validation_rules.dart';
import '../../model/note_status.dart';
import '../../../core/objects/value_object.dart';

class NoteStatus extends ValueObject<NoteStatusModel> {
  factory NoteStatus.initial() {
    const NoteStatusModel initialStatus = NoteStatusModel(
      isNoteFinished: false,
      priority: NoteValidationRules.defaultNotePriority,
      dueDate: null,
    );

    return const NoteStatus._(
      value: Right(
        initialStatus,
      ),
    );
  }

  const NoteStatus._({required super.value});
}
