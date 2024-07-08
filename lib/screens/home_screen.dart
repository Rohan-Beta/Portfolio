// ignore_for_file: prefer_const_constructors

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/Welcome_screen.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/education_screen.dart';
import 'package:portfolio/screens/footer_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:portfolio/screens/skill_screen.dart';
import 'package:portfolio/utilss/globals.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:portfolio/widgets/app_bar_widget.dart';
import 'package:portfolio/widgets/drawer_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ItemScrollController itemScrollController = ItemScrollController();
  PageController pageController = PageController(initialPage: 0);
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  List<Widget> screens = [
    WelcomeScreen(),
    AboutScreen(),
    ProjectScreen(),
    EducationScreen(),
    SkillScreen(),
    FooterScreen(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(100, 100),
        child: AppBarWidget(
          opacity: 0,
          itemScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemScrollController: itemScrollController),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxRadius: 30,
            spawnMinSpeed: 15,
            particleCount: ScreenHeleper.isMobile(context) ? 80 : 300,
            spawnMaxSpeed: 40,
            spawnOpacity: 0.1,
            baseColor: Colors.blue,
            // image: Image(
            //   image: AssetImage("Myassets/star.png"),
            // ),
          ),
        ),
        // child: Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("Myassets/back.jpeg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemCount: screens.length,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemBuilder: (context, index) {
            final screen = screens[index];

            return screen;
          },
        ),
        // ),
      ),
    );
  }
}
