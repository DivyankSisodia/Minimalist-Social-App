import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/constants.dart';

import 'gender_radio_tile.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({
    super.key,
    required this.gender,
    required this.onChanged,
  });

  final String? gender;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 4,
          )
        ],
        color: AppColors.darkWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GenderRadioTile(
            title: 'Male',
            value: 'male',
            selctedValue: gender,
            onChanged: onChanged,
          ),
          const Gap(10),
          GenderRadioTile(
            title: 'Female',
            value: 'female',
            selctedValue: gender,
            onChanged: onChanged,
          ),
          const Gap(10),
          GenderRadioTile(
            title: 'Rather not to say',
            value: 'Others',
            selctedValue: gender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
