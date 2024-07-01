// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/utilss/globals.dart';
import 'package:portfolio/widgets/app_bar_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ItemScrollController itemScrollController = ItemScrollController();
  PageController pageController = PageController(initialPage: 0);
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

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
    );
  }
}
