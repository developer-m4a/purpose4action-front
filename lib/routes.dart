import 'package:flutter/material.dart';
import 'package:purpose4action/ui/home_page.dart';
import 'package:purpose4action/ui/not_found_page.dart';
import 'package:purpose4action/ui/opportunity_page.dart';
import 'package:purpose4action/ui/opportunity_subscribe_page.dart';

Route<dynamic>? onGenerateRoutes(settings) {

  // TODO: apply logic to secured urls
  return MaterialPageRoute(builder: (context) => loadPageFromName(settings.name), settings: settings);
}

Widget loadPageFromName(String name) {

  if (name == '/') {
    return HomePage();
  }

  if (name == HomePage.route) {
    return HomePage();
  }

  if (name == OpportunityPage.route) {
    return OpportunityPage();
  }

  if (name == OpportunitySubscribePage.route) {
    return OpportunitySubscribePage();
  }

  // Handle '/details/:id'
  var uri = Uri.parse(name);
  if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
    var id = uri.pathSegments[1];
    return HomePage();
  }

  return NotFoundPage();
}