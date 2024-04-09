import 'package:flutter/material.dart';
import 'package:social_media_app/features/posts/presentation/widgets/make_post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FeedMakePostWidget()
      ],
    );
  }
}
