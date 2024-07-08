// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/MyData/footer_item.data.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/footer_link.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterScreen extends StatefulWidget {
  const FooterScreen({super.key});

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenHeleper(
      mobile: _buildUi(ScreenHeleper.mobileMaxWidth(context)),
      tablet: _buildUi(tableMaxWidth),
      desktop: _buildUi(desktopMaxWidth),
    );
  }

  _buildUi(double width) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10),
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get in touch",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      height: 1.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: footerData
                          .map(
                            (FooterItemModel) => SizedBox(
                              height: 120,
                              width: ScreenHeleper.isMobile(context)
                                  ? constraints.maxWidth / 2 - 20
                                  : constraints.maxWidth / 4 - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                        ),
                                        onPressed: () => FooterLink.launchURL(
                                            FooterItemModel.link),
                                        child: Image.asset(
                                          FooterItemModel.iconPath,
                                          width: 25,
                                        ),
                                      ),
                                      ScreenHeleper.isMobile(context)
                                          ? SizedBox(width: 0)
                                          : SizedBox(width: 15),
                                      Text(
                                        FooterItemModel.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Flex(
                    direction: ScreenHeleper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: ScreenHeleper.isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Copyright (c) 2024 $name. All Right Reserved",
                          style: TextStyle(
                            color: captionColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: captionColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "|",
                              style: TextStyle(
                                color: captionColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                "Terms & Condition",
                                style: TextStyle(
                                  color: captionColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
