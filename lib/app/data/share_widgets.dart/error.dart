import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class PatientErrorWidget extends StatelessWidget {
  const PatientErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.redAccent),
            const SizedBox(height: 12),
            Text(controller.errorMessage.value, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: controller.fetchPatients, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
