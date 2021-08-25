import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({required this.text, this.padding, this.textAlign});

  final String text;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (this.padding != null) ? this.padding! : EdgeInsets.zero,
      child: Text(
          this.text,
          style: Theme.of(context).textTheme.headline1,
          textAlign: this.textAlign,
      ),
    );
  }

}