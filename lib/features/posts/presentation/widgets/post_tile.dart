import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../model/post.dart';
import '../../providers/post_provider.dart';
import '/core/constants/app_colors.dart';
import '/core/widgets/post_info_tile.dart';

import 'Round_like_icon.dart';
import 'icon_text_button.dart';
import 'posts_image_video_view.dart';

class PostTile extends ConsumerWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          PostInfoTile(
            datePublished: post.createdAt,
            userId: post.posterId,
          ),
          // Post Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(post.content),
          ),
          // Post Video / Image
          PostImageVideoView(
            fileUrl: post.fileUrl,
            fileType: post.postType,
          ),
          // Post Stats and Buttons
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Column(
              children: [
                // Post stats
                PostStats(
                  likes: post.likes,
                ),
                const Divider(),
                // Post Buttons
                PostButtons(post: post),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostButtons extends ConsumerWidget {
  const PostButtons({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = post.likes.contains(FirebaseAuth.instance.currentUser!.uid);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          icon: isLiked
              ? FontAwesomeIcons.solidThumbsUp
              : FontAwesomeIcons.thumbsUp,
          color: isLiked ? AppColors.blueColor : AppColors.blackColor,
          label: 'Like',
          onPressed: () {
            ref
                .read(postProvider)
                .likeDislikePost(postId: post.postId, likes: post.likes);
          },
        ),
        IconTextButton(
          icon: FontAwesomeIcons.solidMessage,
          label: 'Comment',
          onPressed: () {
            // Navigate to comments screen
          },
        ),
        IconTextButton(
          icon: FontAwesomeIcons.share,
          label: 'Share', 
          onPressed: () { 
            // Share post
           },
        ),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  const PostStats({
    super.key,
    required this.likes,
  });

  final List<String> likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const RoundLikeIcon(),
        const SizedBox(width: 5),
        Text('${likes.length}'),
      ],
    );
  }
}
