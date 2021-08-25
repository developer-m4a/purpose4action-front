import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purpose4action/app.dart';
import 'package:purpose4action/infrastructure/web_utils/configure_nonweb.dart' if (dart.library.html) 'package:purpose4action/infrastructure/web_utils/configure_web.dart';

void main() {
  configureApp();
  runApp(
    ProviderScope(
        child: MyApp()
    ),
  );
}
