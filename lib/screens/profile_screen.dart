import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/data.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:flutter_portfolio/widgets/box_container.dart';
import 'package:flutter_portfolio/widgets/skills_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

late StateProvider provider;
late MediaQueryData mediaData;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<StateProvider>(context, listen: true);
    mediaData = MediaQuery.of(context);
    return Container(
      height: mediaData.size.height - 31,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: mediaData.size.width <= 720
                  ? mediaData.size.width
                  : mediaData.size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        user.imageURL,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.fname} ${user.lname}".toUpperCase(),
                        style: Styles.title.copyWith(
                            color: provider.colorPalette.thirdColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.1),
                      ),
                      Text(
                        user.profession,
                        style: Styles.timeTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: provider.colorPalette.mainColor,
                            letterSpacing: 1.1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(user.countryImojie),
                          const SizedBox(width: 5),
                          Text(user.countryName,
                              style: Styles.bottomNavText.copyWith(
                                  color: provider.colorPalette.thirdColor,
                                  fontSize: 14))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            BoxContainer(title: "About", content: user.about),
            Flexible(
              child: SkillsWidget(
                  title: "Skills",
                  categories:
                      user.skills.map((e) => e.category).toSet().toList(),
                  skills: user.skills),
            )
          ],
        ),
      ),
    );
  }
}
