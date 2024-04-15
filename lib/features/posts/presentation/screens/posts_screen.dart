import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/core/widgets/post_info_tile.dart';

import '../../../../core/screens/error_screen.dart';
import '../../../../core/screens/loader.dart';
import '../../providers/get_all_posts_provider.dart';
import '../widgets/make_post.dart';
import '../widgets/post_tile.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        FeedMakePostWidget(),
        SliverToBoxAdapter(
          child: SizedBox(height: 8),
        ),

        // Stories View
        // StoriesView(),
        // SliverToBoxAdapter(
        //   child: SizedBox(height: 8),
        // ),

        // displays list of posts
        PostsList(),
      ],
    );
  }
}

class PostsList extends ConsumerWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getAllPostsProvider);

    return posts.when(
      data: (postsList) {
        return SliverList.separated(
          itemCount: postsList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final post = postsList.elementAt(index);
            return PostTile(
              post: post,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: ErrorScreen(error: error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Loader(),
        );
      },
    );
  }
}
