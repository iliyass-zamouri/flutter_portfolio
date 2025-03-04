import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/school.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EducationCard extends StatelessWidget {
  final School school;
  const EducationCard({Key? key, required this.school}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Center(
              child: Icon(LineAwesomeIcons.school,
                  color: provider.colorPalette.thirdColor)),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school.name,
                  style: Styles.tileTitle.copyWith(
                    color: provider.colorPalette.thirdColor,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  school.field,
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  "${school.startTime} - ${school.graduation}",
                  style: Styles.tileTitle.copyWith(
                      color: provider.colorPalette.thirdColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
