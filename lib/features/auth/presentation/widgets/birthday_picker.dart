import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/extensions.dart';

class BirthdayPickerWidget extends StatelessWidget {
  const BirthdayPickerWidget(
      {super.key, required this.dateTime, required this.onPressed});

  final DateTime dateTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              'Birthday (${DateTime.now().year - dateTime.year} year old)',
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            const Gap(5),
            Text(
              dateTime.yMMMEd(),
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
