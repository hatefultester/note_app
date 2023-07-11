import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}

class JsonEncodingFailure extends Failure {
  const JsonEncodingFailure(
      {super.message = 'Error happen during Object conversion to JSON string'});
}

class JsonDecodingFailure extends Failure {
  const JsonDecodingFailure(
      {super.message = 'Error happen during JSON String conversion to object'});
}
