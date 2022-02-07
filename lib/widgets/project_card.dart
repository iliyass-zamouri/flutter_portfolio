import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:flutter_portfolio/widgets/line_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: Styles.tileTitle.copyWith(
                height: 1.2,
                color: provider.colorPalette.thirdColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${project.startDate} - ${project.endDate}",
              style: Styles.tileTitle.copyWith(
                  color: provider.colorPalette.thirdColor.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(height: 4),

            if (project.associated != null) ...[
              const SizedBox(height: 2),
              if (project.isEducationRelated)
                Row(
                  children: [
                    const SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(LineAwesomeIcons.school)),
                    Text(
                      "Associated with ${project.associated.name}",
                      style: Styles.tileTitle.copyWith(
                          color: provider.colorPalette.thirdColor,
                          height: 1.3,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
                  ],
                ),
              if (!project.isEducationRelated)
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: provider.colorPalette.thirdColor
                                  .withOpacity(0.1))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          project.associated.imageURL,
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    Text("Associated with ${project.associated.name}",
                        style: Styles.tileTitle.copyWith(
                            color: provider.colorPalette.thirdColor,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            fontSize: 14))
                  ],
                ),
              const SizedBox(height: 2),
            ],
            const SizedBox(height: 4),

            SizedBox(
              width: 120,
              child: LineButton(
                  text: "See Project",
                  onClick: () => html.window.open(project.url, 'new tab')),
            ),
            const SizedBox(height: 8),

            ReadMoreText(
              "${project.description}\n",
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
    );
  }
}
