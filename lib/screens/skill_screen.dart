// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/MyData/skill_data.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenHeleper(
      mobile: _buildUi(ScreenHeleper.mobileMaxWidth(context)),
      tablet: _buildUi(tableMaxWidth),
      desktop: _buildUi(desktopMaxWidth),
    );
  }

  _buildUi(double width) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHeleper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHeleper.isMobile(context) ? 0 : 2,
                      child: Lottie.asset("Myassets/animation/skills.json",
                          width: 500),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: ScreenHeleper.isMobile(context) ? 0 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skills",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 40),
                          // Text(
                          //   skills,
                          //   style: TextStyle(
                          //     color: captionColor,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Column(
                          //   children: skillsData
                          //       .map(
                          //         (SkillModel) => Container(
                          //           margin: EdgeInsets.only(bottom: 16),
                          //           child: Row(
                          //             children: [
                          //               Expanded(
                          //                 flex: SkillModel.percentage,
                          //                 child: Container(
                          //                   padding: EdgeInsets.only(left: 12),
                          //                   alignment: Alignment.center,
                          //                   height: 38,
                          //                   color: Colors.white,
                          //                   child: Text(
                          //                     SkillModel.skill,
                          //                   ),
                          //                 ),
                          //               ),
                          //               SizedBox(width: 12),
                          //               Expanded(
                          //                 flex: 100 - SkillModel.percentage,
                          //                 child: Divider(color: Colors.white),
                          //               ),
                          //               SizedBox(width: 12),
                          //               Text(
                          //                 "${SkillModel.percentage}%",
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 16),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: skillsData
                                    .map(
                                      (SkillModel) => SizedBox(
                                        width: constraints.maxWidth / 2 - 20,
                                        child: Column(
                                          children: [
                                            Text(
                                              SkillModel.skill,
                                              style: TextStyle(
                                                  color: captionColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
