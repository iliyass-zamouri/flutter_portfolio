import 'package:flutter/material.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:provider/provider.dart';

class LineButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback? onClick;
  final Color mainColor;
  final Color textColor;
  final Color splashColor;
  const LineButton(
      {Key? key,
      this.onClick,
      this.mainColor = Styles.mainColor,
      this.textColor = Styles.mainColor,
      this.splashColor = Colors.black,
      this.textStyle = Styles.tileTitle,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateProvider provider = Provider.of<StateProvider>(context);
    return Material(
      color: provider.colorPalette.backgroundColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(20),
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: mainColor,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(text, style: textStyle.copyWith(color: textColor))),
        ),
      ),
    );
  }
}
