import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        size: 17.sp,
        color: Colors.white,
      ),
      SizedBox(
        width: 10.sp,
      ),
      Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    ]);
  }
}
