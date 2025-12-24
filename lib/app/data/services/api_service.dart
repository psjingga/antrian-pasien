import 'package:dio/dio.dart';
import '../models/patient_model.dart';

class ApiService {
  final Dio _dio = Dio();

  // GANTI jika ingin API lain
  final String _url = 'https://dummyjson.com/c/b3ca-4cfb-47cb-b7a5';

  Future<List<PatientModel>> fetchPatients() async {
    final response = await _dio.get(_url);
    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => PatientModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }
}
