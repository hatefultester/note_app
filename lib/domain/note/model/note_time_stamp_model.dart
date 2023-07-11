import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class NoteTimeStampModel extends Equatable {
  final DateTime creationTime;
  final Option<DateTime> lastEditTime;

  const NoteTimeStampModel({
    required this.creationTime,
    required this.lastEditTime,
  });

  @override
  List<Object?> get props => [creationTime, lastEditTime];
}
