import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl implements NetworkChecker {
  NetworkCheckerImpl({required this._checker});

  final InternetConnection _checker;

  @override
  Future<bool> get isConnected => _checker.hasInternetAccess;
}
