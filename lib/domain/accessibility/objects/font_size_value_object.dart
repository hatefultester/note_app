import 'package:dartz/dartz.dart';
import 'package:note_app/domain/accessibility/interfaces/accessibility_interfaces.dart';

import '../../core/error/value_failure.dart';
import '../../core/objects/value_object.dart';

class FontSizeValueObject<T extends IAccessibilityValidator> extends ValueObject<double> {
  factory FontSizeValueObject({required double fontSize, required T validator}) {
    final Either<ValueFailure<double>, double> fontSizeValidated = validator.validateFontSize(fontSize: fontSize);

    return FontSizeValueObject._(
      value: fontSizeValidated
    );
  }

  const FontSizeValueObject._({required super.value});
}