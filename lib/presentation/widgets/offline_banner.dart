import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/network_service.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final networkService = Get.find<NetworkService>();

    return Obx(() {
      final connected = networkService.isConnected;
      if (connected) return const SizedBox.shrink();

      return Container(
        width: double.infinity,
        color: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.wifi_off, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text(
              "You’re offline. Some features may not work.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }
}
