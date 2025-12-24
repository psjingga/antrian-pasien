import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class PatientLoadingOverlay extends StatelessWidget {
  const PatientLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (!controller.isLoading.value) return const SizedBox();
      return Container(
        color: Colors.black.withValues(alpha: 0.15),
        child: const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
