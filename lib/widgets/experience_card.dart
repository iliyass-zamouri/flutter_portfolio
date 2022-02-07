import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/enterprise.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ExperienceCard extends StatelessWidget {
  final Enterprise enterprise;
  const ExperienceCard({Key? key, required this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(enterprise.imageURL, width: 60, height: 60),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  enterprise.post,
                  style: Styles.tileTitle.copyWith(
                    height: 1.2,
                    color: provider.colorPalette.thirdColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${enterprise.name} · ${enterprise.contract.getName()}",
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  "${enterprise.startTime} - ${enterprise.endTime} · ${enterprise.duration}",
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                const SizedBox(height: 8),

                ReadMoreText(
                  "${enterprise.description}\n",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor,
                      height: 1.3,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  lessStyle: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  moreStyle: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.mainColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                // Text(
                //   enterprise.description,
                //   style: Styles.tileTitle.copyWith(
                //       color: provider.colorPalette.thirdColor,
                //       fontWeight: FontWeight.w400,
                //       fontSize: 12),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
