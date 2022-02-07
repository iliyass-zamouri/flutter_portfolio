import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_portfolio/data/data.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/custom_scroll.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:flutter_portfolio/widgets/box_container_extended.dart';
import 'package:flutter_portfolio/widgets/education_card.dart';
import 'package:flutter_portfolio/widgets/experience_card.dart';
import 'package:flutter_portfolio/widgets/project_card.dart';
import 'package:flutter_portfolio/widgets/responsive_list.dart';
import 'package:flutter_portfolio/extentions.dart';
import 'package:provider/provider.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({Key? key}) : super(key: key);

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

late StateProvider provider;
late MediaQueryData mediaData;

final _controller = ScrollController();

class _CareerScreenState extends State<CareerScreen> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<StateProvider>(context, listen: true);
    mediaData = MediaQuery.of(context);
    return Container(
      height: mediaData.size.height - 31,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ImprovedScrolling(
        scrollController: _controller,
        enableMMBScrolling: true,
        enableKeyboardScrolling: true,
        enableCustomMouseWheelScrolling: true,
        keyboardScrollConfig: KeyboardScrollConfig(
          arrowsScrollAmount: 250.0,
          homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
            return const Duration(milliseconds: 100);
          },
          endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
            return const Duration(milliseconds: 2000);
          },
        ),
        customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
          scrollAmountMultiplier: 2.0,
        ),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flex(direction: Axis.vertical, children: [
                  ExtendedBoxContainer(
                      title: "Education",
                      content: user.education!.reversed
                          .map((e) => EducationCard(school: e))
                          .addSpaceDivider(10,
                              Styles.divider(provider.colorPalette.thirdColor))
                          .toList()),
                  ExtendedBoxContainer(
                      title: "Experience",
                      content: user.experience!.reversed
                          .map((e) => ExperienceCard(enterprise: e))
                          .addSpaceDivider(10,
                              Styles.divider(provider.colorPalette.thirdColor))
                          .toList()),
                  ExtendedBoxContainer(
                      title: "Projects",
                      content: user.projects.reversed
                          .map((e) => ProjectCard(project: e))
                          .addSpaceDivider(10,
                              Styles.divider(provider.colorPalette.thirdColor))
                          .toList()),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
