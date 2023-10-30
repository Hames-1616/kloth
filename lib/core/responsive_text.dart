import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  ResponsiveText({
    this.text = 'text',
    this.textAlign = TextAlign.left,
    this.style = const TextStyle(fontSize: 14),
    Key? key
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: text,
        style: style,
      ),
    );
  }
}