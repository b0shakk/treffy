import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treffy_portfolio/app_view.dart';
import 'package:treffy_portfolio/contact.dart';
import 'package:treffy_portfolio/highlights.dart';
import 'package:treffy_portfolio/navbar.dart';
import 'package:treffy_portfolio/photographs.dart';
import 'package:treffy_portfolio/router_generator.dart';
import 'package:treffy_portfolio/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "treffy",
      debugShowCheckedModeBanner: false,
      // home: NavBar(),
      builder: (_, child) => AppView(
        child: child!,
      ),
      initialRoute: routeHome,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
