// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/MyData/header_item.data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DrawerWidget extends StatelessWidget {
  final ItemScrollController itemScrollController;

  const DrawerWidget({super.key, required this.itemScrollController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                headerItemsData[index].title,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                itemScrollController.scrollTo(
                  index: headerItemsData[index].index,
                  duration: Duration(seconds: 1),
                );
                Navigator.pop(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 12);
          },
          itemCount: headerItemsData.length,
        ),
      ),
    );
  }
}