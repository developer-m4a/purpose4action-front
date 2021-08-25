import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  Paragraph({required this.text, this.padding, this.textAlign});

  final String text;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (this.padding != null) ? this.padding! : EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          this.text,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: this.textAlign,
        ),
      )
    );
  }

}