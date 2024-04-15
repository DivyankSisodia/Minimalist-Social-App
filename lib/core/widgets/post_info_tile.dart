import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/core/constants/constants.dart';
import 'package:social_media_app/core/constants/extensions.dart';
import 'package:social_media_app/features/auth/Provider/get_user_info_by_id_provider.dart';

class PostInfoTile extends ConsumerWidget {
  const PostInfoTile({
    super.key,
    required this.datePublished,
    required this.userId,
  });

  final DateTime datePublished;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(userId));
    return userInfo.when(
      data: (user) {
        return Padding(
          padding: Constants.defaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.profilePicUrl),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    datePublished.fromNow(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      error: (error, _) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
