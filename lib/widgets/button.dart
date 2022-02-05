import 'package:flutter/material.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String? toolTip;
  final bool isMainColor;
  final VoidCallback onTap;
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.toolTip,
      this.isMainColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMainColor
        ? Material(
            borderRadius: BorderRadius.circular(50),
            color: Styles.mainColor,
            child: IconButton(
              splashColor: Colors.black,
              hoverColor: Colors.black,
              tooltip: toolTip,
              highlightColor: Colors.black,
              splashRadius: 23,
              iconSize: 30,
              icon: Icon(icon, color: Colors.white),
              onPressed: onTap,
            ),
          )
        : Material(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
            child: IconButton(
              splashColor: Styles.mainColor,
              hoverColor: Styles.mainColor,
              tooltip: toolTip,
              highlightColor: Styles.mainColor,
              splashRadius: 24,
              iconSize: 30,
              icon: Icon(icon, color: Colors.white),
              onPressed: onTap,
            ),
          );
  }
}
