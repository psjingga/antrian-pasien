import 'package:flutter/material.dart';

class PatientCardWidget extends StatelessWidget {
  final String name;
  final String poly;
  final String status;

  const PatientCardWidget({super.key, required this.name, required this.poly, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _polyColor().withValues(alpha: .15),
          child: Icon(_polyIcon(), color: _polyColor()),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Poli $poly'),
        trailing: _statusBadge(),
      ),
    );
  }

  IconData _polyIcon() {
    switch (poly) {
      case 'Umum':
        return Icons.local_hospital;
      case 'Gigi':
        return Icons.healing;
      case 'Anak':
        return Icons.child_care;
      default:
        return Icons.person;
    }
  }

  Color _polyColor() {
    switch (poly) {
      case 'Umum':
        return Colors.blue;
      case 'Gigi':
        return Colors.purple;
      case 'Anak':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _statusBadge() {
    Color color;

    switch (status) {
      case 'Menunggu':
        color = Colors.orange;
        break;
      case 'Diproses':
        color = Colors.blue;
        break;
      case 'Selesai':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color.withValues(alpha: .15), borderRadius: BorderRadius.circular(20)),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
