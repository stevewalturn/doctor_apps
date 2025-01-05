import 'package:flutter/material.dart';
import 'package:doctor_apps/ui/common/app_colors.dart';

class HomeStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const HomeStatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? kcSurfaceWhite,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kcMediumGrey,
                    ),
                  ),
                  Icon(
                    icon,
                    color: iconColor ?? kcPrimaryColor,
                    size: 24,
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
      ),
    );
  }
}
