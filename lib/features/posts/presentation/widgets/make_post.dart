import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/constants.dart';
import 'package:social_media_app/features/posts/presentation/screens/create_post_screen.dart';
import 'package:social_media_app/features/posts/presentation/widgets/rounded_profile_tile.dart';

class FeedMakePostWidget extends StatelessWidget {
  const FeedMakePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CreatePostScreen.routeName);
        },
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  const RoundProfileTile(url: Constants.maleProfilePic),
                  _buildPostTextField(),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      FontAwesomeIcons.solidImages,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

_buildPostTextField() {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.darkGreyColor),
      ),
      child: const Text('What\'s on your mind?'),
    ),
  );
}
