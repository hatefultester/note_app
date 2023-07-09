import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/core/error/value_failure.dart';
import 'package:note_app/domain/entities/value_objects/note_description.dart';

main() {
  group("NoteDescription test cases", () {
    test("NoteDescription initial hold MinimalLengthNotReachedFailure", () {
      final NoteDescription noteDescription =
          NoteDescription.initial();

      expect(noteDescription.isValid, false);
      expect(noteDescription.value.fold((l) => l, (r) => r),
          isA<MinimalLengthNotReachedFailure>());
    });

    test("NoteDescription should hold MinimalLengthNotReachedFailure", () {
      String emptyDescription = '';

      for (int i = 0; i < 100; i++) {
        emptyDescription += ' ';
      }

      final NoteDescription noteDescription =
          NoteDescription(description: emptyDescription);

      expect(noteDescription.isValid, false);
      expect(noteDescription.value.fold((l) => l, (r) => r),
          isA<MinimalLengthNotReachedFailure>());
    });

    test("NoteDescription should hold MaximalLengthReachedFailure", () {
      String longDescription = '';

      for (int i = 0; i < 300; i++) {
        longDescription += '1';
      }

      final NoteDescription noteDescription =
          NoteDescription(description: longDescription);

      expect(noteDescription.isValid, false);
      expect(noteDescription.value.fold((l) => l, (r) => r),
          isA<MaximalLengthReachedFailure>());
    });

    test("NoteDescription should hold MaximalLengthReachedFailure", () {
      String validDescription = 'This is example of valid description';

      final NoteDescription noteDescription =
          NoteDescription(description: validDescription);

      expect(noteDescription.isValid, true);
      expect(noteDescription.value.fold((l) => l, (r) => r), isA<String>());
      expect(noteDescription.value.fold((l) => l, (r) => r), validDescription);
    });
  });
}
