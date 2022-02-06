import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/data.dart';
import 'package:flutter_portfolio/screens/profile_screen.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
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
  late MediaQueryData mediaData;
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<StateProvider>(context, listen: true);
    mediaData = MediaQuery.of(context);
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
                      fontWeight: FontWeight.w400)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (mediaData.size.width >= 720)
                    for (int i = 0; i < aboutMenu.length; i++) ...[
                      CustomTextButton(
                        text: aboutMenu[i],
                        mainColor: Colors.transparent,
                        textColor: currentIndex == i
                            ? provider.colorPalette.mainColor
                            : provider.colorPalette.thirdColor,
                        onClick: () => pageController.jumpToPage(i),
                      ),
                      const SizedBox(width: 5),
                    ],
                  if (mediaData.size.width < 720)
                    PopupMenuButton<String>(
                        color: provider.colorPalette.secondColor,
                        elevation: 2,
                        enabled: true,
                        icon: Icon(Icons.more_vert,
                            color: provider.colorPalette.thirdColor),
                        onSelected: (value) {
                          pageController.jumpToPage(aboutMenu.indexOf(value));
                        },
                        itemBuilder: (context) {
                          return aboutMenu.map((choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: Text(
                                choice,
                                style: Styles.tileTitle.copyWith(
                                    color: provider.colorPalette.thirdColor),
                              ),
                            );
                          }).toList();
                        }),

                  //  Material(
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: Colors.transparent,
                  //     child: IconButton(
                  //       splashColor: Colors.white,
                  //       // hoverColor: provider.colorPalette.mainColor,
                  //       tooltip: "ESC",
                  //       highlightColor: provider.colorPalette.mainColor,
                  //       splashRadius: 20,
                  //       icon: Icon(
                  //         Icons.clear,
                  //         color: provider.colorPalette.thirdColor,
                  //       ),
                  //       onPressed: () => Navigator.pop(context),
                  //     ),
                  //   ),
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
