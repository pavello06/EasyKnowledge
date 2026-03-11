sealed class Failure {}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnknownFailure extends Failure {}
