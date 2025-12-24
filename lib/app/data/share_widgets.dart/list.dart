import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';
import 'card.dart';
import 'empty.dart';
import 'error.dart';

class PatientListWidget extends StatelessWidget {
  const PatientListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.errorMessage.isNotEmpty) {
        return const PatientErrorWidget();
      }

      if (controller.patients.isEmpty && !controller.isLoading.value) {
        return const PatientEmptyWidget();
      }

      return RefreshIndicator(
        onRefresh: () async {
          controller.isLoading.value = true;
          await controller.fetchPatients();
        },
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: controller.patients.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, index) {
            final p = controller.patients[index];
            return PatientCardWidget(name: p.name, poly: p.poly, status: p.status);
          },
        ),
      );
    });
  }
}
