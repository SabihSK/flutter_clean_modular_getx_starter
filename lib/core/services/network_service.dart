import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool _isConnected = true.obs;

  bool get isConnected => _isConnected.value;
  Stream<bool> get connectionStream => _isConnected.stream;

  StreamSubscription<dynamic>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _initializeNetworkMonitoring();
  }

  Future<void> _initializeNetworkMonitoring() async {
    final initialResult = await _connectivity.checkConnectivity();

    ConnectivityResult firstResult;
    firstResult = initialResult.isNotEmpty
        ? initialResult.first
        : ConnectivityResult.none;
    _updateStatus(firstResult);

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      ConnectivityResult res;
      res = result.isNotEmpty ? result.first : ConnectivityResult.none;
      _updateStatus(res);
    });
  }

  void _updateStatus(ConnectivityResult result) {
    final connected = result != ConnectivityResult.none;
    if (_isConnected.value != connected) {
      _isConnected.value = connected;
      if (!connected) {
        // Optional: show a global snackbar when offline
        Get.snackbar(
          'No Internet',
          'You appear to be offline',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
