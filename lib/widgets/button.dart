import 'package:flutter/material.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String? toolTip;
  final bool isMainColor;
  final bool isLight;
  final bool isBlended;
  final VoidCallback onTap;
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.toolTip,
      this.isLight = false,
      this.isBlended = false,
      this.isMainColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateProvider provider = Provider.of<StateProvider>(context, listen: true);
    if (isBlended) {
      return Material(
        borderRadius: BorderRadius.circular(50),
        color: provider.colorPalette.backgroundColor,
        child: IconButton(
          splashColor: provider.colorPalette.secondColor,
          hoverColor: provider.colorPalette.secondColor,
          tooltip: toolTip,
          highlightColor: Styles.mainColor,
          splashRadius: 24,
          iconSize: 30,
          icon: Icon(icon, color: provider.colorPalette.thirdColor),
          onPressed: onTap,
        ),
      );
    }
    if (isMainColor) {
      return Material(
        borderRadius: BorderRadius.circular(50),
        color: isLight ? provider.colorPalette.thirdColor : Styles.mainColor,
        child: IconButton(
          splashColor: provider.colorPalette.secondColor,
          hoverColor: isLight
              ? provider.colorPalette.thirdColor
              : provider.colorPalette.secondColor,
          tooltip: toolTip,
          highlightColor: isLight
              ? provider.colorPalette.thirdColor
              : provider.colorPalette.secondColor,
          splashRadius: isLight ? 20 : 23,
          iconSize: isLight ? 24 : 30,
          icon: Icon(icon,
              color: isLight
                  ? provider.colorPalette.secondColor
                  : provider.colorPalette.thirdColor),
          onPressed: onTap,
        ),
      );
    } else {
      return Material(
        borderRadius: BorderRadius.circular(50),
        color: provider.colorPalette.secondColor,
        child: IconButton(
          splashColor: Styles.mainColor,
          hoverColor: Styles.mainColor,
          tooltip: toolTip,
          highlightColor: Styles.mainColor,
          splashRadius: 24,
          iconSize: 30,
          icon: Icon(icon, color: provider.colorPalette.thirdColor),
          onPressed: onTap,
        ),
      );
    }
  }
}
