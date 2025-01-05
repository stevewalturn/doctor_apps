import 'package:flutter/material.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';

class PatientSummaryTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const PatientSummaryTile({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color ?? kcPrimaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: kcMediumGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kcDarkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
