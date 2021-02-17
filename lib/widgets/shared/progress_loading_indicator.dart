import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void hideLoading() {
  if (Get.isDialogOpen) {
    Get.close(1);
  }
}