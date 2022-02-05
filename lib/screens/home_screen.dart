import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/about_screen.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:flutter_portfolio/widgets/button.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late MediaQueryData mediaData;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    mediaData = MediaQuery.of(context);
    return Material(
      color: Colors.white,
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
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(-0.02, .8),
                      colors: <Color>[
                        Colors.black,
                        Colors.black,
                        Styles.mainColor
                      ],
                    )),
                    width: mediaData.size.width,
                    child: Swiper(
                      containerHeight: mediaData.size.height - 30,
                      itemBuilder: (BuildContext context, int index) {
                        return swiperItems[index];
                      },
                      itemCount: 2,
                      pagination: const SwiperPagination(),
                      control: const SwiperControl(
                          color: Colors.transparent,
                          disableColor: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Wrap(
                  children: [
                    CustomIconButton(
                        icon: FontAwesomeIcons.github,
                        toolTip: 'Github',
                        isMainColor: false,
                        onTap: () => html.window.open(
                            'https://github.com/iliyass-zamouri', 'new tab')),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomIconButton(
                        icon: FontAwesomeIcons.twitter,
                        toolTip: "Twitter",
                        isMainColor: false,
                        onTap: () => html.window.open(
                            'https://twitter.com/iliyass_zamouri', 'new tab')),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomIconButton(
                        icon: FontAwesomeIcons.linkedinIn,
                        toolTip: "LinkedIn",
                        isMainColor: false,
                        onTap: () => html.window.open(
                            'https://www.linkedin.com/in/zamouri', 'new tab'))
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
        color: Colors.black,
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
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/29772839",
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
                        "Iliyass Zamouri".toUpperCase(),
                        style: Styles.title.copyWith(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1),
                      ),
                      Text(
                        "Software Developer",
                        style: Styles.timeTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Styles.mainColor,
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    splashColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      mediaData.size.width >= 720 ? 200 : 0),
                              child: SizedBox(
                                height: mediaData.size.height,
                                child: const AboutScreen(),
                              ),
                            )),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Styles.mainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "About Me",
                          style: Styles.tileTitle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  List<Widget> swiperItems = [
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
            "Web & Mobile".toUpperCase(),
            textAlign: TextAlign.center,
            style: Styles.title.copyWith(
                fontSize: 70,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3),
          ),
          Text(
            "Development".toUpperCase(),
            textAlign: TextAlign.center,
            style: Styles.title.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: const FlutterLogo(size: 30)),
              const SizedBox(width: 5),
              Text(
                "Flutter".toUpperCase(),
                textAlign: TextAlign.center,
                style: Styles.title.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
            ],
          ),
        ],
      ),
    )
  ];
}
