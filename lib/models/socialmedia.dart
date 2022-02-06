import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia {
  final WebSite site;
  final String url;
  const SocialMedia({required this.site, required this.url});
}

enum WebSite { github, twitter, linkedin, stackoverflow }

extension WebSiteHelper on WebSite {
  String getName() {
    switch (this) {
      case WebSite.github:
        return "Github";
      case WebSite.linkedin:
        return "LinkedIn";
      case WebSite.twitter:
        return "Twitter";
      case WebSite.stackoverflow:
        return "Stack Overflow";
      default:
        return "";
    }
  }

  IconData getIcon() {
    switch (this) {
      case WebSite.github:
        return FontAwesomeIcons.github;
      case WebSite.linkedin:
        return FontAwesomeIcons.linkedinIn;
      case WebSite.twitter:
        return FontAwesomeIcons.twitter;
      case WebSite.stackoverflow:
        return FontAwesomeIcons.stackOverflow;
      default:
        return FontAwesomeIcons.unlink;
    }
  }
}
