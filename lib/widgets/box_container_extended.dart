import 'package:flutter/material.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/custom_scroll.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:provider/provider.dart';

class ExtendedBoxContainer extends StatelessWidget {
  final String title;
  final List<Widget> content;
  const ExtendedBoxContainer(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaData = MediaQuery.of(context);
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.all(10),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: Styles.tileTitle.copyWith(
                  color: provider.colorPalette.thirdColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView.builder(
                itemCount: content.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return content[index];
                }),
          )
        ],
      ),
    );
  }
}
