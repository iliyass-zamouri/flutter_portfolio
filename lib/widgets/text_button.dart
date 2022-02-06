import 'package:flutter/material.dart';
import 'package:flutter_portfolio/styles/styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback? onClick;
  final Color mainColor;
  final Color textColor;
  final Color splashColor;
  const CustomTextButton(
      {Key? key,
      this.onClick,
      this.mainColor = Styles.mainColor,
      this.textColor = Colors.white,
      this.splashColor = Colors.black,
      this.textStyle = Styles.tileTitle,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(20),
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(text, style: textStyle.copyWith(color: textColor))),
        ),
      ),
    );
  }
}
