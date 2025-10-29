import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class Helpers {
  /// Display snackbar with message
  static void showSnackBar(
    String message, {
    String title = 'Notice',
    bool isError = false,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.redAccent : Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
    );
  }

  /// Global API error handler
  static void handleApiError(DioException e) {
    String errorMsg = 'An unexpected error occurred.';

    if (e.response != null && e.response?.data is Map) {
      errorMsg = e.response?.data['message'] ?? errorMsg;
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      errorMsg = 'Connection timeout. Please check your internet connection.';
    }

    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
    showSnackBar(errorMsg, isError: true);
  }

  /// Date formatting (example utility)
  static String formatDate(DateTime date) =>
      "${date.day}/${date.month}/${date.year}";

  /// Safe print (only logs in debug mode)
  static void safeLog(String message) {
    assert(() {
      debugPrint('🔍 $message');
      return true;
    }());
  }
}
