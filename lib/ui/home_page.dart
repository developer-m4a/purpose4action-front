import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purpose4action/components/custom_drawer.dart';
import 'package:purpose4action/components/custom_toolbar.dart';
import 'package:purpose4action/components/header.dart';
import 'package:purpose4action/components/paragraph.dart';
import 'package:purpose4action/components/primary_button.dart';
import 'package:purpose4action/components/secondary_button.dart';
import 'package:purpose4action/ui/opportunity_page.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar().build(context),
      drawer: CustomDrawer().build(context),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(48.0),
                  child: Image.asset('assets/landing_1.png'),
                ),
                Header(
                  text: "Find And Do What Matters To You",
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  textAlign: TextAlign.center,
                ),
                Paragraph(
                  text: "Take our test to explore your skills and values and find opportunities that match those",
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  textAlign: TextAlign.center,
                ),
                PrimaryButton(
                  text: "Take Our Test",
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                ),
                SecondaryButton(
                  text: "Volunteer Now",
                  onPressed: () => {Navigator.pushNamed(context, OpportunityPage.route)},
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                ),
              ],
            )),
      ),
    );
  }
}
