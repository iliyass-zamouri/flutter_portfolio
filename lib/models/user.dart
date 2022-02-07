import 'package:flutter_portfolio/models/enterprise.dart';
import 'package:flutter_portfolio/models/school.dart';
import 'package:flutter_portfolio/models/skill.dart';
import 'package:flutter_portfolio/models/socialmedia.dart';

class User {
  final String fname;
  final String lname;
  final String profession;
  final List<Enterprise>? experience;
  final List<School>? education;
  final String about;
  final List<Skill> skills;
  final String countryName;
  final String countryImojie;
  final String imageURL;
  final List<SocialMedia> socialmedia;
  const User(
      {required this.fname,
      required this.lname,
      required this.profession,
      this.experience,
      this.education,
      required this.about,
      required this.skills,
      this.socialmedia = const [],
      required this.countryName,
      required this.countryImojie,
      required this.imageURL});
}
