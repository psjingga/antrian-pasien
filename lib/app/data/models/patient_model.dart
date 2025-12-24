class PatientModel {
  final String name;
  final String status;
  final String poly;

  PatientModel({required this.name, required this.status, required this.poly});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(name: json['name'], status: json['status'], poly: json['poly']);
  }
}
