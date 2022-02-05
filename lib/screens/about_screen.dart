import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/tabbar.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("About Me",
                  overflow: TextOverflow.ellipsis,
                  style: Styles.tileTitle.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                child: IconButton(
                  splashColor: Colors.white,
                  // hoverColor: Styles.mainColor,
                  tooltip: "ESC",
                  highlightColor: Styles.mainColor,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
          height: 1,
        ),
        // const TabBarDemo()
        Flexible(
          flex: 1,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Styles.spinkit,
                const SizedBox(width: 5),
                Text(
                  "My information will be available soon",
                  style: Styles.miniPlayerTile.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
