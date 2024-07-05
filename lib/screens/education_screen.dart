// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/MyData/education_data.dart';
import 'package:portfolio/MyModel/education_model.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
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
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                defaultScale: false,
                child: Flex(
                  direction: ScreenHeleper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHeleper.isMobile(context) ? 0 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 5),
                          Wrap(
                            children: [
                              Text(
                                education,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: educationData
                                    .map(
                                      (EducationModel) => SizedBox(
                                        width: constraints.maxWidth / 2 - 20,
                                        child: Column(
                                          children: [
                                            Text(
                                              EducationModel.period,
                                              style: GoogleFonts.oswald(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              EducationModel.description,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: captionColor,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                EducationModel.linkName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
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
