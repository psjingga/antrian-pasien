import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/share_widgets.dart/filter.dart';
import '../../../data/share_widgets.dart/list.dart';
import '../../../data/share_widgets.dart/loading.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Antrian Pasien'), centerTitle: true),
        body: Stack(
          children: [
            Column(
              children: const [
                PatientFilterWidget(),
                Expanded(child: PatientListWidget()),
              ],
            ),
            const PatientLoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
