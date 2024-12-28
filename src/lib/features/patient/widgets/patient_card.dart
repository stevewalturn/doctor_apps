import 'package:flutter/material.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';
import 'package:gap/gap.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const PatientCard({
    Key? key,
    required this.patient,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      patient.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _showDeleteConfirmation(context),
                  ),
                ],
              ),
              const Gap(8),
              _buildInfoRow(Icons.phone, patient.phone),
              const Gap(4),
              _buildInfoRow(Icons.calendar_today, '${patient.age} years'),
              const Gap(4),
              _buildInfoRow(Icons.person, patient.gender),
              if (patient.address.isNotEmpty) ...[
                const Gap(4),
                _buildInfoRow(Icons.location_on, patient.address),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: kcMediumGrey),
        const Gap(8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: kcMediumGrey,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Patient'),
        content: const Text(
          'Are you sure you want to delete this patient? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (result == true) {
      onDelete();
    }
  }
}
