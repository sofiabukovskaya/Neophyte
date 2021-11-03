import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

abstract class IConnectionService extends GetxService {
  Future<void> GetConnectionType();
  void updateState(ConnectivityResult result);
}
