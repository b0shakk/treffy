import 'package:flutter/material.dart';
import 'package:treffy_portfolio/contact.dart';
import 'package:treffy_portfolio/highlights.dart';
import 'package:treffy_portfolio/photographs.dart';
import 'package:treffy_portfolio/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HighlightsPage());
      case routePhotographs:
        return MaterialPageRoute(builder: (_) => PhotographsPage());
      case routeContact:
        return MaterialPageRoute(builder: (_) => ContactsPage());
    }
    return MaterialPageRoute(builder: (_) => HighlightsPage());
  }
}