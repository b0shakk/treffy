import 'package:flutter/material.dart';
import 'package:treffy_portfolio/navbar.dart';

class AppView extends StatelessWidget {
  
final Widget child;
  
const AppView({required this.child});
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [NavBar(), Expanded(child: child)],
      ),
    );
  }
}