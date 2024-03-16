import 'package:flutter/material.dart';
import 'package:social_media_app/core/contants/app_colors.dart';
import 'package:social_media_app/core/contants/constants.dart';

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
          GenderRadioTile(
            title: 'Female',
            value: 'female',
            selctedValue: gender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
