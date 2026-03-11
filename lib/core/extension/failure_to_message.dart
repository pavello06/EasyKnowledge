import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/core/l10n/s.dart';
import 'package:flutter/material.dart';

extension FailureToMessage on Failure {
  String message(BuildContext context) => switch (this) {
    NetworkFailure() => S.of(context).easyNetworkFailure,
    ServerFailure() => S.of(context).easyServerFailure,
    CacheFailure() => S.of(context).easyCacheFailure,
    UnknownFailure() => S.of(context).easyUnknownFailure,
  };
}
