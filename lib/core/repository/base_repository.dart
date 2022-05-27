import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:language_corrector/core/errors/exceptions.dart';
import 'package:language_corrector/core/errors/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> invoke<T>(FutureOr<T> Function() job) async {
    try {
      return Right(await job());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode, e.exception));
    } on CacheException catch (e) {
      return Left(CacheFailure(e));
    } on NoInternetException catch (e) {
      return Left(NoInternetConnectionFailure(e));
    } catch (e) {
      log(e.toString());
      return Left(GeneralFailure(e));
    }
  }
}
