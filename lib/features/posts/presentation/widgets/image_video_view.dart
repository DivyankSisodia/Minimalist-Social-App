import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_app/features/posts/presentation/widgets/video_view.dart';

class ImageVideoView extends StatelessWidget {
  const ImageVideoView({
    super.key,
    required this.file,
    required this.fileType,
  });

  final File file;
  final String fileType;

  @override
  Widget build(BuildContext context) {
    if (fileType == 'image') {
      return Image.file(file);
    } else {
      return VideoView(
        video: file,
      );
    }
  }
}

