import 'package:flutter/material.dart';
import 'package:social_media_app/core/contants/app_colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.label,
    this.color = AppColors.lightBlueColor,
    required this.onPressed,
    this.height = 50,
  });

  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.darkBlueColor,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: (color == AppColors.lightBlueColor && onPressed != null)
                ? AppColors.realWhiteColor
                : AppColors.darkBlueColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
