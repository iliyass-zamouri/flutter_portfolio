import 'package:flutter/cupertino.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
        return LineAwesomeIcons.github;
      case WebSite.linkedin:
        return LineAwesomeIcons.linkedin_in;
      case WebSite.twitter:
        return LineAwesomeIcons.twitter;
      case WebSite.stackoverflow:
        return LineAwesomeIcons.stack_overflow;
      default:
        return LineAwesomeIcons.unlink;
    }
  }
}
