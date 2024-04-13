import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/constants.dart';
import '../../../../core/widgets/rounded_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: _buildLogoText(),
          ),
          actions: [
            _messageButton(),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.blueColor,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            onTap: (index) {
              setState(() {});
            },
            tabs: Constants.getHomeScreenTabs(_tabController.index),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Constants.screens,
        ),
      ),
    );
  }

  Widget _buildLogoText() => Text(
        'Chirp',
        style: GoogleFonts.pacifico(
          fontSize: 30,
          color: Colors.black,
        ),
      );

  Widget _messageButton() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: RoundIconButton(icon: FontAwesomeIcons.facebookMessenger),
      );
}
