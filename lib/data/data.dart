import 'package:flutter_portfolio/models/skill.dart';
import 'package:flutter_portfolio/models/socialmedia.dart';
import 'package:flutter_portfolio/models/user.dart';

User user = User(
    fname: "Iliyass",
    lname: "Zamouri",
    profession: "Software Developer",
    skills: skills,
    about: aboutMe,
    socialmedia: sites,
    countryImojie: '🇲🇦',
    countryName: "Morocco",
    imageURL: "https://avatars.githubusercontent.com/u/29772839");

List<Skill> skills = const [
  Skill(name: "Windows", category: "Operating Systems"),
  Skill(name: "Linux Distributions", category: "Operating Systems"),
  Skill(name: "MacOS", category: "Operating Systems"),
  Skill(name: "Laravel", category: "Web Frameworks"),
  Skill(name: "Flutter Web", category: "Web Frameworks"),
  Skill(name: "Vue JS", category: "Web Frameworks"),
  Skill(name: "React JS", category: "Web Frameworks"),
  Skill(name: "Tailwind CSS", category: "Web Frameworks"),
  Skill(name: "BootStrap", category: "Web Frameworks"),
  Skill(name: "Laravel API", category: "Web Frameworks"),
  Skill(name: "Dart (Flutter)", category: "Programming Languages"),
  Skill(name: "PHP", category: "Programming Languages"),
  Skill(name: "JavaScript", category: "Programming Languages"),
  Skill(name: "Java (OOP)", category: "Programming Languages"),
  Skill(name: "HTML", category: "Programming Languages"),
  Skill(name: "CSS", category: "Programming Languages"),
  Skill(name: "MySql", category: "Database"),
  Skill(name: "Sql Server", category: "Database"),
  Skill(name: "FireBase", category: "Database"),
  Skill(name: "SupaBase (Postgres)", category: "Database"),
  Skill(name: "Flutter (Android/IOS)", category: "Mobile Development"),
  Skill(name: "UML", category: "Project Modeling"),
  Skill(name: "Merise", category: "Project Modeling"),
  Skill(name: "Trello", category: "WorkFlow"),
  Skill(name: "GitHub", category: "Codebase Management"),
  Skill(name: "GitLab", category: "Codebase Management"),
  Skill(name: "Netlify", category: "Deployment"),
  Skill(name: "Cpanel", category: "Deployment"),
  Skill(name: "Google Developer Console (Android)", category: "Deployment"),
  Skill(name: "App Store Connect (IOS)", category: "Deployment"),
];
List<SocialMedia> sites = const [
  SocialMedia(site: WebSite.github, url: "https://github.com/iliyass-zamouri"),
  SocialMedia(
      site: WebSite.twitter, url: "https://twitter.com/iliyass_zamouri"),
  SocialMedia(
      site: WebSite.linkedin, url: "https://www.linkedin.com/in/zamouri"),
  SocialMedia(
      site: WebSite.stackoverflow,
      url: "https://stackoverflow.com/users/12698729/iliyass"),
];

String aboutMe =
    "I am an Software Project Designer, Consultant in Software Development Technologies. Web Application developer (Full Stack) and Mobile Application Developer with two years experience in the Flutter mobile framework (IOS/Android). Experienced in UI/UX.";

String whatIdo = "Web & Mobile";

String whatItIS = "Development";

List<String> aboutMenu = ["Profile", "Career", "Contact"];
