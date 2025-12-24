import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../data/models/patient_model.dart';
import '../../../data/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  final box = GetStorage();

  var patients = <PatientModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  /// 🔹 DEFAULT = ALL
  var selectedStatus = 'All'.obs;
  var selectedPoly = 'All'.obs;

  @override
  void onInit() {
    selectedStatus.value = box.read('status') ?? 'All';
    selectedPoly.value = box.read('poly') ?? 'All';
    fetchPatients();
    super.onInit();
  }

  Future<void> fetchPatients() async {
    final hasConnection = await InternetConnectionChecker.instance.hasConnection;

    if (!hasConnection) {
      errorMessage.value = 'Tidak ada koneksi internet. Silakan cek jaringan Anda.';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final data = await _apiService.fetchPatients();

      patients.value = data.where((p) {
        final statusMatch = selectedStatus.value == 'All' || p.status == selectedStatus.value;
        final polyMatch = selectedPoly.value == 'All' || p.poly == selectedPoly.value;
        return statusMatch && polyMatch;
      }).toList();
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan saat mengambil data. Coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateFilter({String? status, String? poly}) async {
    isLoading.value = true;

    if (status != null) {
      selectedStatus.value = status;
      box.write('status', status);
    }

    if (poly != null) {
      selectedPoly.value = poly;
      box.write('poly', poly);
    }

    await fetchPatients();
  }
}
