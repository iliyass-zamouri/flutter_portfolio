import 'package:flutter/material.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:provider/provider.dart';

class BoxContainer extends StatelessWidget {
  final String title;
  final String content;
  const BoxContainer({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaData = MediaQuery.of(context);
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.all(10),
      width: mediaData.size.width <= 720
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
              overflow: TextOverflow.ellipsis,
              style: Styles.tileTitle.copyWith(
                  color: provider.colorPalette.thirdColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text(
            content,
            style: Styles.textSubTitle.copyWith(
                color: provider.colorPalette.thirdColor.withOpacity(0.7),
                height: 1.4),
          ),
        ],
      ),
    );
  }
}
