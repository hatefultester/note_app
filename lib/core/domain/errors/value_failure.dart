import 'dart:ui';

import '../../../feature/note_catalog/domain/models/note_priority_model.dart';
import '../../../feature/note_catalog/domain/models/note_time_stamp_model.dart';

import 'failure.dart';

abstract class ValueFailure<T> implements Failure {
  final T value;
  @override
  final String message;
  final dynamic stackTrace;

  const ValueFailure({required this.value, required this.message, this.stackTrace});

  @override
  bool? get stringify => true;
}

class InvalidEnumValue extends ValueFailure<String> {
  InvalidEnumValue({required super.value, required super.message, super.stackTrace});

  @override
  List<Object?> get props => [value, stackTrace, message];

}

class MinimalLengthNotReachedFailure extends ValueFailure<String> {
  final int minimalLengthRequired;
  final int lengthReached;

  const MinimalLengthNotReachedFailure(
      {required super.value,
      required super.message,
        super.stackTrace,
      required this.minimalLengthRequired,
      required this.lengthReached});

  @override
  List<Object?> get props => [value, message, stackTrace, minimalLengthRequired, lengthReached];

}

class MaximalLengthReachedFailure extends ValueFailure<String> {
  final int maximalLengthAllowed;
  final int lengthReached;

  const MaximalLengthReachedFailure(
      {required super.value,
        required super.message,
        super.stackTrace,
        required this.maximalLengthAllowed,
        required this.lengthReached});

  @override
  List<Object?> get props => [value, message, stackTrace, maximalLengthAllowed, lengthReached];

  @override
  bool? get stringify => true;
}

class InvalidLastEditTimeFailure extends ValueFailure<NoteTimeStampModel> {
  InvalidLastEditTimeFailure({required super.value, required super.message});

  @override
  List<Object?> get props => [value, message];
}

class InvalidFontSize extends ValueFailure<double> {
  InvalidFontSize({required super.value, super.message = 'Font size selected is not supported by system'});

  @override
  List<Object?> get props => [message, value, stackTrace];

}

class InvalidColorPatternSelection extends ValueFailure<Map<NotePriority, Color>> {
  InvalidColorPatternSelection({required super.value, super.message = 'You can\'t select same colors for different priorities'});

  @override
  List<Object?> get props => [message, value, stackTrace];
}