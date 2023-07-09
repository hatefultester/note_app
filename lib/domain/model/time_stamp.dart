import 'package:equatable/equatable.dart';

class TimeStampModel extends Equatable{
  final DateTime creationTime;
  final DateTime? lastEditTime;

  const TimeStampModel({
    required this.creationTime,
    this.lastEditTime,
  });

  @override
  List<Object?> get props => [creationTime, lastEditTime];


}
