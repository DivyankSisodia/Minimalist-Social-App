import 'package:flutter/material.dart';

import 'post_video_view.dart';

class PostImageVideoView extends StatelessWidget {
  const PostImageVideoView({super.key, required this.fileUrl, required this.fileType});

  final String fileUrl;
  final String fileType;

  @override
  Widget build(BuildContext context) {
    if (fileType == 'image') {
      return Image.network(fileUrl);
    } else {
      return PostVideoView(
        videoUrl: fileUrl,
      );
    }
  }
}
