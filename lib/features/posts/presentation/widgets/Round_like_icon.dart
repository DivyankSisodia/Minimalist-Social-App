import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';


import '../../../../core/constants/app_colors.dart';

class RoundLikeIcon extends StatelessWidget {
  const RoundLikeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 12,
      backgroundColor: AppColors.blueColor,
      child: FaIcon(
        FontAwesomeIcons.solidThumbsUp,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}
