import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/constants.dart';
import 'package:social_media_app/core/utils/utils.dart';
import 'package:social_media_app/core/widgets/rounded_button.dart';
import 'package:social_media_app/features/posts/presentation/widgets/image_video_view.dart';
import 'package:social_media_app/features/posts/presentation/widgets/profile_info.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/create-post';

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late final TextEditingController _postController;
  File? file;

  String fileType = 'image';

  @override
  void initState() {
    _postController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileInfo(),

              // Post text field
              TextField(
                controller: _postController,
                minLines: 1,
                maxLines: 7,
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: 18,
                  ),
                ),
                keyboardType: TextInputType.multiline,
              ),
              file != null
                  ? ImageVideoView(
                      file: file!,
                      fileType: fileType,
                    )
                  : PickFileWidget(
                      pickImage: () async {
                        fileType = 'image';
                        file = await pickImage();
                        setState(() {});
                      },
                      pickVideo: () async {
                        fileType = 'video';
                        file = await pickVideo();
                        setState(() {});
                      },
                    ),

              const SizedBox(
                height: 20,
              ),
              RoundedButton(label: 'Post', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({
    super.key,
    required this.pickImage,
    required this.pickVideo,
  });

  final VoidCallback pickImage;
  final VoidCallback pickVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: pickImage,
          child: const Text('Pick Image'),
        ),
        const Divider(),
        TextButton(
          onPressed: pickVideo,
          child: const Text('Pick Video'),
        ),
      ],
    );
  }
}
