import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:social_media_app/core/constants/constants.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.image,
  });

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade600,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          image != null
              ? CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(image!),
                )
              : const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(Constants.maleProfilePic),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.grey.shade600,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
