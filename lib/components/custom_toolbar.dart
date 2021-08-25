import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purpose4action/components/primary_button.dart';
import 'package:purpose4action/ui/home_page.dart';

class CustomToolbar {

  PreferredSizeWidget? build(BuildContext context) {
    return AppBar(
        title: Container(
          child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Image.asset('assets/logo.png'),
              ),
              onTap: () => {
                Navigator.pushNamed(context, HomePage.route)
              },
          ),
          constraints: BoxConstraints(
              maxHeight: AppBar().preferredSize.height
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: PrimaryButton(
              text: "Log In",
              onPressed: () {},
              minHeight: 16.0,
              minWidth: 64.0,
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            )
          ),
        ]
    );
  }

}