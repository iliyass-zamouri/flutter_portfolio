import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/data.dart';
import 'package:flutter_portfolio/models/socialmedia.dart';
import 'package:flutter_portfolio/screens/about_screen.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:flutter_portfolio/widgets/button.dart';
import 'package:flutter_portfolio/widgets/text_button.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late MediaQueryData mediaData;
late List<Widget> swiperItems;

class _HomeScreenState extends State<HomeScreen> {
  SwiperController swiperController = SwiperController();

  late StateProvider provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaData = MediaQuery.of(context);
    provider = Provider.of<StateProvider>(context, listen: true);
    swiperItems = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // RichText(
            //     text: TextSpan(
            //   text: "I'm a".toUpperCase(),
            //   style: Styles.timeTextStyle,
            //     children: [
            //   TextSpan(text: "".toUpperCase(),style:  )
            // ]
            // )),
            Text(
              whatIdo.toUpperCase(),
              textAlign: TextAlign.center,
              style: Styles.title.copyWith(
                  fontSize: 70,
                  color: provider.colorPalette.thirdColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3),
            ),
            Text(
              whatItIS.toUpperCase(),
              textAlign: TextAlign.center,
              style: Styles.title.copyWith(
                  fontSize: 20,
                  color: provider.colorPalette.thirdColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ],
        ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Know more about me".toUpperCase(),
                  style: Styles.title.copyWith(
                      color: provider.colorPalette.thirdColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1.1),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.south,
                      color: provider.colorPalette.thirdColor,
                    )),
                CustomTextButton(
                  text: "About Me",
                  onClick: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                            color: provider.colorPalette.backgroundColor,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    mediaData.size.width >= 720 ? 200 : 0),
                            child: SizedBox(
                              height: mediaData.size.height,
                              child: const AboutScreen(),
                            ),
                          )),
                ),
              ],
            ),
          ],
        ),
      )
    ];
    return Material(
      color: provider.colorPalette.backgroundColor,
      child: SizedBox(
        height: mediaData.size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: provider.colorPalette.backgroundColor),
                    width: mediaData.size.width,
                    child: Swiper(
                      containerHeight: mediaData.size.height - 30,
                      itemBuilder: (BuildContext context, int index) {
                        return swiperItems[index];
                      },
                      itemCount: 2,
                      controller: swiperController,
                      control: const SwiperControl(
                          color: Colors.transparent,
                          disableColor: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 5,
                child: CustomIconButton(
                  icon: CupertinoIcons.chevron_right,
                  isBlended: true,
                  onTap: () => swiperController.next(),
                )),
            Positioned(
                left: 5,
                child: CustomIconButton(
                  icon: CupertinoIcons.chevron_left,
                  isBlended: true,
                  onTap: () => swiperController.previous(),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Wrap(
                  children: [
                    for (SocialMedia webSite in user.socialmedia) ...[
                      CustomIconButton(
                          icon: webSite.site.getIcon(),
                          toolTip: webSite.site.getName(),
                          isMainColor: false,
                          onTap: () =>
                              html.window.open(webSite.url, 'new tab')),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: provider.colorPalette.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: provider.colorPalette.thirdColor, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      user.imageURL,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${user.fname} ${user.lname}".toUpperCase(),
                        style: Styles.title.copyWith(
                            color: provider.colorPalette.thirdColor,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1),
                      ),
                      Text(
                        user.profession,
                        style: Styles.timeTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: provider.colorPalette.mainColor,
                            letterSpacing: 1.1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Material(
                  color: provider.colorPalette.secondColor,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () =>
                        Provider.of<StateProvider>(context, listen: false)
                            .toggleColor(),
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        provider.isDark
                            ? Icons.wb_sunny_rounded
                            : FontAwesomeIcons.moon,
                        color: provider.colorPalette.thirdColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CustomTextButton(
                  text: "About Me",
                  onClick: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                            color: provider.colorPalette.backgroundColor,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    mediaData.size.width >= 720 ? 200 : 0),
                            child: SizedBox(
                              height: mediaData.size.height,
                              child: const AboutScreen(),
                            ),
                          )),
                )
              ],
            )
          ],
        ));
  }
}
