import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/core/error/value_failure.dart';
import 'package:note_app/domain/business_rules/note_validation_rules.dart';
import 'package:note_app/domain/entities/value_objects/note_title.dart';

main() {
  group("NoteTitle test cases", () {
    late final int maxLength;
    late final int minLength;

    setUpAll(() {
      minLength = NoteValidationRules.noteTitleMinLength;
      maxLength = NoteValidationRules.noteTitleMaxLength;
    });

    test("NoteTitle with empty initial value should hold MinimalLengthNotReachedFailure", () {
      final NoteTitle noteTitle =
      NoteTitle.initial();

      expect(noteTitle.isValid, false);
      expect(noteTitle.value.fold((l) => l, (r) => r),
          isA<MinimalLengthNotReachedFailure>());
    });

    test("NoteTitle with value that has just spaces should hold MinimalLengthNotReachedFailure", () {
      String emptyTitle = '';

      for (int i = 0; i < maxLength; i++) {
        emptyTitle += ' ';
      }

      final NoteTitle noteTitle =
      NoteTitle(title: emptyTitle);

      expect(noteTitle.isValid, false);
      expect(noteTitle.value.fold((l) => l, (r) => r),
          isA<MinimalLengthNotReachedFailure>());
    });

    test("NoteTitle with long string input should hold MaximalLengthReachedFailure", () {
      String longTitle = '';

      for (int i = 0; i < (maxLength + 1); i++) {
        longTitle += '1';
      }

      final NoteTitle noteTitle =
      NoteTitle(title: longTitle);

      expect(noteTitle.isValid, false);
      expect(noteTitle.value.fold((l) => l, (r) => r),
          isA<MaximalLengthReachedFailure>());
    });

    test("NoteTitle with valid input should hold String value of title", () {
      String validTitle = 'Valid title';

      final NoteTitle noteDescription =
      NoteTitle(title: validTitle);

      expect(noteDescription.isValid, true);
      expect(noteDescription.value.fold((l) => l, (r) => r), isA<String>());
      expect(noteDescription.value.fold((l) => l, (r) => r), validTitle);
    });
  });
}
