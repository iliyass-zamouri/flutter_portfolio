import 'package:flutter_portfolio/models/enterprise.dart';
import 'package:flutter_portfolio/models/project.dart';
import 'package:flutter_portfolio/models/school.dart';
import 'package:flutter_portfolio/models/skill.dart';
import 'package:flutter_portfolio/models/socialmedia.dart';
import 'package:flutter_portfolio/models/user.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

User user = User(
    fname: "Iliyass",
    lname: "Zamouri",
    profession: "Software Developer",
    skills: skills,
    about: aboutMe,
    socialmedia: sites,
    experience: workedAt,
    projects: projects,
    education: education,
    countryImojie: '🇲🇦',
    countryName: "Morocco",
    imageURL: "https://avatars.githubusercontent.com/u/29772839");

List<Skill> skills = const [
  Skill(
      name: "Windows",
      logo: LineAwesomeIcons.windows,
      category: "Operating Systems"),
  Skill(
      name: "Linux Distributions",
      logo: LineAwesomeIcons.linux,
      category: "Operating Systems"),
  Skill(
      name: "MacOS",
      logo: LineAwesomeIcons.apple,
      category: "Operating Systems"),
  Skill(
      name: "Laravel",
      logo: LineAwesomeIcons.laravel,
      category: "Web Frameworks"),
  Skill(
      name: "Flutter Web",
      logo: LineAwesomeIcons.chrome,
      category: "Web Frameworks"),
  Skill(
      name: "Vue JS",
      logo: LineAwesomeIcons.vue_js,
      category: "Web Frameworks"),
  Skill(
      name: "React JS",
      logo: LineAwesomeIcons.react,
      category: "Web Frameworks"),
  Skill(
      name: "Tailwind CSS",
      logo: LineAwesomeIcons.css_3_logo,
      category: "Web Frameworks"),
  Skill(
      name: "BootStrap",
      logo: LineAwesomeIcons.bootstrap,
      category: "Web Frameworks"),
  Skill(
      name: "Laravel API",
      logo: LineAwesomeIcons.connect_develop,
      category: "Web Frameworks"),
  Skill(
      name: "Dart (Flutter)",
      logo: LineAwesomeIcons.dev,
      category: "Programming Languages"),
  Skill(
      name: "PHP",
      logo: LineAwesomeIcons.php,
      category: "Programming Languages"),
  Skill(
      name: "JavaScript",
      logo: LineAwesomeIcons.javascript__js_,
      category: "Programming Languages"),
  Skill(name: "Algorithm", logo: LineAwesomeIcons.dev, category: "CS"),
  Skill(
      name: "Computer Architecture",
      logo: LineAwesomeIcons.laptop,
      category: "CS"),
  Skill(
      name: "Photoshop",
      logo: LineAwesomeIcons.adobe,
      category: "Manipulation of Multimedia"),
  Skill(
      name: "Adobe Premiere",
      logo: LineAwesomeIcons.adobe,
      category: "Manipulation of Multimedia"),
  Skill(
      name: "Java (OOP)",
      logo: LineAwesomeIcons.java,
      category: "Programming Languages"),
  Skill(
      name: "HTML",
      logo: LineAwesomeIcons.html_5_logo,
      category: "Programming Languages"),
  Skill(
      name: "CSS",
      logo: LineAwesomeIcons.css_3_logo,
      category: "Programming Languages"),
  Skill(name: "MySql", logo: LineAwesomeIcons.database, category: "Database"),
  Skill(
      name: "Sql Server",
      logo: LineAwesomeIcons.database,
      category: "Database"),
  Skill(name: "FireBase", logo: LineAwesomeIcons.cloud, category: "Database"),
  Skill(
      name: "SupaBase (Postgres)",
      logo: LineAwesomeIcons.cloud,
      category: "Database"),
  Skill(
      name: "Flutter (Android/IOS)",
      logo: LineAwesomeIcons.dev,
      category: "Mobile Development"),
  Skill(
      name: "UML",
      logo: LineAwesomeIcons.creative_commons,
      category: "Project Modeling"),
  Skill(
      name: "Merise",
      logo: LineAwesomeIcons.creative_commons,
      category: "Project Modeling"),
  Skill(
      name: "Adobe XD",
      logo: LineAwesomeIcons.adobe,
      category: "Project Modeling"),
  Skill(
      name: "Trello",
      logo: LineAwesomeIcons.trello,
      category: "Project Management"),
  Skill(
      name: "GitHub",
      logo: LineAwesomeIcons.github,
      category: "Codebase Management"),
  Skill(
      name: "GitLab",
      logo: LineAwesomeIcons.gitlab,
      category: "Codebase Management"),
  Skill(name: "Netlify", logo: LineAwesomeIcons.cloud, category: "Deployment"),
  Skill(name: "Cpanel", logo: LineAwesomeIcons.cpanel, category: "Deployment"),
  Skill(
      name: "Google Developer Console (Android)",
      logo: LineAwesomeIcons.google_play,
      category: "Deployment"),
  Skill(
      name: "App Store Connect (IOS)",
      logo: LineAwesomeIcons.apple,
      category: "Deployment"),
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

List<Enterprise> workedAt = [
  Enterprise(
      name: "IM-CREATIVE",
      imageURL:
          "https://media-exp1.licdn.com/dms/image/C4D0BAQEaSrVdIHGXgw/company-logo_200_200/0/1618918702222?e=1652313600&v=beta&t=vlPjeq-Co8xZ8dm1JTaqvnp4ZF1JlvhPCkrN2ncmsvM",
      post: "Web Application Developer",
      description:
          "Web development with laravel.\n\nDeveloped a realtime chatbox with Laravel (backend), Vuejs (Frontend) in a laravel project.\n\nDevelop a mobile version of the same chatbox in a flutter app.\n\nSetup an API to connect the mobile chatbox with the Web version.",
      startTime: "Jun 2021",
      endTime: "Jun 2021",
      duration: "1 mo"),
  Enterprise(
      name: "Rhéo Services",
      imageURL:
          "https://media-exp1.licdn.com/dms/image/C4D03AQH45z4JaVfYFQ/profile-displayphoto-shrink_800_800/0/1617474633389?e=1649894400&v=beta&t=VfEto45nXgnJglWVZwELv-K3i-bkW-OvbSLpx2Yfg9Y",
      post: "Mobile Software Developer",
      contract: ContractType.freelance,
      startTime: "Oct 2021",
      duration: "8 mo"),
  Enterprise(
      name: "Nativys",
      imageURL:
          "https://media-exp1.licdn.com/dms/image/C560BAQHObfYQyzaTrg/company-logo_200_200/0/1626983535628?e=1652313600&v=beta&t=ovGp6oNC16-MDLeOGPeHlWxH2REEvfWzsygBHNlgQ7c",
      post: "Mobile Software Developer",
      description:
          "Developing, Managing & Maintaining two mobile apps.\n\nNativys: App for clients to help them make a reservation in a beauty institution.\n\nNativys Pro: Mobile CRM for professionals in the beauty centers industry to help them manage their clients, reservations and revenue.",
      startTime: "Oct 2021",
      duration: "5 mo"),
];

List<School> education = [
  School(
      name: "Imam Ben Hanbal",
      field: "Physical Science",
      startTime: "Sep 2015",
      graduation: "Jun 2018"),
  School(
      name: "Brevet de Technicien Supérieur (BTS)",
      field: "Development of information systems (DSI)",
      startTime: "2019",
      graduation: "2021")
];

List<Project> projects = [
  Project(
      name: "Location (Rent Collaboration)",
      startDate: "Jun 2021",
      endDate: "Jun 2021",
      url: "https://github.com/GestionCollocation",
      associatedEnterprise: workedAt[0],
      description:
          "Web and Mobile application for helping people collaborate in renting and finding properties."),
  Project(
      name: "Fuel Delivery",
      startDate: "Oct 2020",
      endDate: "Jun 2021",
      url: "https://github.com/fuel-delivery",
      associatedSchool: education[1],
      description:
          "Mobile App with 3 user types.\n\nClient: Can order, follow up with the order, manage his orders and favorites gaz-stations.\n\nWorker (delivery): Accept an order and deliver it, confirm the delivery (QrCode Scan) and change his status.\n\n Manager: Manage workers, orders, assign new workers.\n\nThis App been created with Flutter (mobile development framework) and Firebase (Backend server with real-time Database)."),
  Project(
      name: "Services de conciergerie",
      startDate: "Aug 2021",
      url: "https://play.google.com/store/apps/details?id=com.rheo.app",
      associatedEnterprise: workedAt[1],
      description: "Reservation management application Real estate cleaning."),
  Project(
      name: "Portfolio WebApp",
      startDate: "Feb 2022",
      url: "https://www.iliyass-zamouri.ga",
      description:
          "Flutter Web targeted App, With responsive design and beautiful UI, And good UX.\n\nYou are currently viewing it 🙂."),
  Project(
      name: "Flutter Agenda (Dart Plugin)",
      startDate: "Feb 2022",
      url: "https://pub.dev/packages/flutter_agenda",
      description:
          "Agenda with diagonal ScrollBehavior.\n\nX Axis: To visualize resources and their appointments or days and events.\nY Axis: hourly timeline.\n\nWorks in all flutter supported platforms."),
  Project(
      name: "Collage Image (Dart Plugin)",
      startDate: "Feb 2022",
      url: "https://pub.dev/packages/image_collage",
      description:
          "Collaging multiple images into a single image.\nAuto layout and the ability to set a click function for each of them (images).\nSupport images from the web and app assets."),
];

var xx = "Application de gestion des réservations nettoyage des immobiliers.";
