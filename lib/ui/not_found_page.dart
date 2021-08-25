import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purpose4action/components/custom_toolbar.dart';
import 'package:purpose4action/components/paragraph.dart';

class NotFoundPage extends StatelessWidget {
  static const String route = '/404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar().build(context),
      body: Center(
        child: Paragraph(
          text: "Sorry this page was not found.",
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}