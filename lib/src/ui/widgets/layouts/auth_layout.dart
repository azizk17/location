import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final String background;
  AuthLayout({
    @required this.body,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/auth-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: this.body,
      ),
    );
  }
}
