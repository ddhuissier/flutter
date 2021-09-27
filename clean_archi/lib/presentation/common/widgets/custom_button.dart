import 'package:clean_archi/presentation/common/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({
    required this.title,
    required this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: d_green,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: d_dark_green),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            color: d_yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
