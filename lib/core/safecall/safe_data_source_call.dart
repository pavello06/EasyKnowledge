import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/core/network/network_checker.dart';

Future<Either<Failure, T>> safeRemoteDataSourceCall<T>(
  NetworkChecker networkChecker,
  Future<T> Function() call,
) async {
  if (await networkChecker.isConnected) {
    try {
      return Right(await call());
    } on FirebaseException {
      return Left(ServerFailure());
    }
  } else {
    return Left(NetworkFailure());
  }
}
