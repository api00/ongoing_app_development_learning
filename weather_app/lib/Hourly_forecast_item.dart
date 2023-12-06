import 'package:flutter/material.dart';

class HourlyForecasItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const HourlyForecasItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
