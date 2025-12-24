import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class PatientFilterWidget extends StatelessWidget {
  const PatientFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  initialValue: controller.selectedStatus.value,
                  decoration: const InputDecoration(labelText: 'Status', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('Semua')),
                    DropdownMenuItem(value: 'Menunggu', child: Text('Menunggu')),
                    DropdownMenuItem(value: 'Diproses', child: Text('Diproses')),
                    DropdownMenuItem(value: 'Selesai', child: Text('Selesai')),
                  ],
                  onChanged: (v) => controller.updateFilter(status: v ?? 'All'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  initialValue: controller.selectedPoly.value,
                  decoration: const InputDecoration(labelText: 'Poli', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('Semua')),
                    DropdownMenuItem(value: 'Umum', child: Text('Umum')),
                    DropdownMenuItem(value: 'Gigi', child: Text('Gigi')),
                    DropdownMenuItem(value: 'Anak', child: Text('Anak')),
                  ],
                  onChanged: (v) => controller.updateFilter(poly: v ?? 'All'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
