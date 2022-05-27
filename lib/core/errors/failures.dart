import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.exception);

  final Object exception;
}

class GeneralFailure extends Failure {
  const GeneralFailure(Object exception) : super(exception);

  @override
  List<Object?> get props => [exception];
}

class ServerFailure extends Failure {
  const ServerFailure(this.statusCode, exception) : super(exception);

  final int? statusCode;

  @override
  List<Object?> get props => [statusCode, exception];
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure(Object exception) : super(exception);

  @override
  List<Object?> get props => [exception];
}

class CacheFailure extends Failure {
  const CacheFailure(Object exception) : super(exception);

  @override
  List<Object?> get props => [exception];
}
