import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/data.dart';
import 'package:flutter_portfolio/models/enterprise.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:flutter_portfolio/widgets/box_container.dart';
import 'package:flutter_portfolio/widgets/skills_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child:ScrollConfiguration(
        behaviour: CustomScroll(),
        child: SingleChildScrollView(
        // padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: mediaData.size.width <= 768
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
                        height: 80,
                        width: 80,
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
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.1),
                      ),
                      Text(
                        user.profession,
                        style: Styles.timeTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: provider.colorPalette.mainColor,
                            letterSpacing: 1.1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.building,
                              color: provider.colorPalette.thirdColor,
                              size: 14),
                          const SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                                "${user.experience!.last.name} · ${user.experience!.last.contract.getName()}",
                                style: Styles.bottomNavText.copyWith(
                                    color: provider.colorPalette.thirdColor,
                                    fontSize: 14)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BoxContainer(title: "About", content: user.about),
            SkillsWidget(
                title: "Skills",
                categories: user.skills.map((e) => e.category).toSet().toList(),
                skills: user.skills)
          ],
        ),
      )),
    );
  }
}
