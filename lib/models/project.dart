import 'package:flutter_portfolio/models/enterprise.dart';
import 'package:flutter_portfolio/models/school.dart';

class Project {
  final String name;
  final String startDate;
  final String endDate;
  final Enterprise? associatedEnterprise;
  final School? associatedSchool;
  final String url;
  final String description;

  Project(
      {required this.name,
      required this.startDate,
      this.endDate = "Present",
      this.associatedEnterprise,
      this.associatedSchool,
      required this.url,
      required this.description});
}
