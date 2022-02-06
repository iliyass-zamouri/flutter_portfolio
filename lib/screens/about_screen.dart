import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/profile_screen.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:flutter_portfolio/widgets/text_button.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page!.round() != currentIndex) {
        setState(() {
          currentIndex = pageController.page!.round();
        });
      }
    });
  }

  late StateProvider provider;

  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<StateProvider>(context, listen: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: provider.colorPalette.secondColor,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("About Me",
                  overflow: TextOverflow.ellipsis,
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextButton(
                    text: "Profile",
                    mainColor: Colors.transparent,
                    textColor: currentIndex == 0
                        ? provider.colorPalette.mainColor
                        : provider.colorPalette.thirdColor,
                    onClick: () => pageController.jumpToPage(0),
                  ),
                  const SizedBox(width: 5),
                  CustomTextButton(
                    text: "Career",
                    mainColor: Colors.transparent,
                    textColor: currentIndex == 1
                        ? provider.colorPalette.mainColor
                        : provider.colorPalette.thirdColor,
                    onClick: () => pageController.jumpToPage(1),
                  ),
                  const SizedBox(width: 5),
                  CustomTextButton(
                    text: "Contact",
                    mainColor: Colors.transparent,
                    textColor: currentIndex == 2
                        ? provider.colorPalette.mainColor
                        : provider.colorPalette.thirdColor,
                    onClick: () => pageController.jumpToPage(2),
                  ),
                  const SizedBox(width: 5),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    child: IconButton(
                      splashColor: Colors.white,
                      // hoverColor: provider.colorPalette.mainColor,
                      tooltip: "ESC",
                      highlightColor: provider.colorPalette.mainColor,
                      splashRadius: 20,
                      icon: Icon(
                        Icons.clear,
                        color: provider.colorPalette.thirdColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Styles.divider(provider.colorPalette.thirdColor),
        Flexible(
            child: PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: pageController,
          children: <Widget>[
            const ProfileScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Styles.spinkit(provider.colorPalette.thirdColor),
                  const SizedBox(width: 5),
                  Text(
                    "My career information will be available soon",
                    style: Styles.miniPlayerTile
                        .copyWith(color: provider.colorPalette.thirdColor),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Styles.spinkit(provider.colorPalette.thirdColor),
                  const SizedBox(width: 5),
                  Text(
                    "My contact information will be available soon",
                    style: Styles.miniPlayerTile
                        .copyWith(color: provider.colorPalette.thirdColor),
                  ),
                ],
              ),
            )
          ],
        )),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
