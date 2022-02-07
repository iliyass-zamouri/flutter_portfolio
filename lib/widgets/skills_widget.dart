// ignore: import_of_legacy_library_into_null_safe
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/skill.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/custom_scroll.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:provider/provider.dart';

class SkillsWidget extends StatefulWidget {
  final String title;
  final List<String> categories;
  final List<Skill> skills;
  const SkillsWidget(
      {Key? key,
      required this.title,
      required this.categories,
      required this.skills})
      : super(key: key);

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

String selectedCategory = "All";
late List<Skill> filtredList;

class _SkillsWidgetState extends State<SkillsWidget> {
  @override
  void initState() {
    super.initState();
    widget.categories.insert(0, "All");
    filtredList = widget.skills;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaData = MediaQuery.of(context);
    StateProvider provider = Provider.of<StateProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: mediaData.size.width <= 768
          ? mediaData.size.width
          : mediaData.size.width * 0.5,
      decoration: BoxDecoration(
          color: provider.colorPalette.secondColor,
          boxShadow: [
            BoxShadow(
                color: provider.colorPalette.thirdColor.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0.1, 0.2))
          ],
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(widget.title,
              overflow: TextOverflow.ellipsis,
              style: Styles.tileTitle.copyWith(
                  color: provider.colorPalette.thirdColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.all(5),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ChipsChoice<String>.single(
                  clipBehavior: Clip.antiAlias,
                  value: selectedCategory,
                  spinnerColor: provider.colorPalette.secondColor,
                  choiceActiveStyle: C2ChoiceStyle(
                      color: provider.colorPalette.mainColor,
                      borderColor: provider.colorPalette.mainColor,
                      brightness:
                          provider.isDark ? Brightness.dark : Brightness.light),
                  choiceStyle: C2ChoiceStyle(
                      labelStyle: Styles.miniPlayerTile
                          .copyWith(color: provider.colorPalette.thirdColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      brightness:
                          provider.isDark ? Brightness.dark : Brightness.light),
                  onChanged: (choice) {
                    if (choice == 'All') {
                      setState(() {
                        filtredList = widget.skills;
                        selectedCategory = choice;
                      });
                    } else {
                      filtredList = [];
                      for (Skill element in widget.skills) {
                        if (element.category == choice) {
                          filtredList.add(element);
                        }
                      }
                      selectedCategory = choice;
                      setState(() {});
                    }
                  },
                  choiceItems: widget.categories
                      .map((e) => C2Choice(value: e, label: e))
                      .toList()),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filtredList.length,
              separatorBuilder: (context, index) {
                return Styles.divider(provider.colorPalette.thirdColor);
              },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: provider.isDark
                        ? BoxDecoration(
                            color: provider.colorPalette.thirdColor,
                            borderRadius: BorderRadius.circular(50))
                        : BoxDecoration(
                            border: Border.all(
                                color: provider.colorPalette.mainColor),
                            color: provider.colorPalette.secondColor,
                            borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        filtredList[index].logo,
                        color: provider.isDark
                            ? provider.colorPalette.secondColor
                            : provider.colorPalette.mainColor,
                        size: 26,
                      ),
                    ),
                  ),
                  title: Text(
                    filtredList[index].name,
                    style: Styles.textSubTitle.copyWith(
                        color: provider.colorPalette.thirdColor, fontSize: 18),
                  ),
                );
              })
        ],
      ),
    );
  }
}
