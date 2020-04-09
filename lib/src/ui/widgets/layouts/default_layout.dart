import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefalutLayout extends StatelessWidget {
  /**
   *  Customs parameters
   * 
   */
  final Widget title;
  final Widget content;
  final EdgeInsetsGeometry padding;
  final SnackBar snackBar;
  final Function showSnackBar;
  final BorderRadius radius;

  /**
   *  # default Schffold parameters
   * 
   */
  final appBar;
  final body;
  final floatingActionButton;
  final floatingActionButtonLocation;
  final floatingActionButtonAnimator;
  final persistentFooterButtons;
  final drawer;
  final endDrawer;
  final bottomNavigationBar;
  final bottomSheet;
  final backgroundColor;
  final resizeToAvoidBottomPadding;
  final resizeToAvoidBottomInset;
  final primary;
  final extendBody;

  const DefalutLayout({
    this.title,
    this.content,
    this.padding = const EdgeInsets.all(0),
    this.radius = const BorderRadius.vertical(top: Radius.circular(13)),

    // Default Scaffold
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.snackBar,
    this.showSnackBar,
    //defult
  })  : assert(
          appBar == null || title == null,
        ),
        assert(body == null || content == null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: this.floatingActionButton,
      floatingActionButtonLocation: this.floatingActionButtonLocation,
      floatingActionButtonAnimator: this.floatingActionButtonAnimator,
      persistentFooterButtons: this.persistentFooterButtons,
      drawer: this.drawer,
      endDrawer: this.endDrawer,
      bottomNavigationBar: this.bottomNavigationBar,
      bottomSheet: this.bottomSheet,
      backgroundColor: this.backgroundColor != null
          ? this.backgroundColor
          : Theme.of(context).primaryColor,
      resizeToAvoidBottomPadding: this.resizeToAvoidBottomPadding,
      resizeToAvoidBottomInset: this.resizeToAvoidBottomInset,
      primary: this.primary,
      extendBody: this.extendBody,
    );
  }

  Widget _appBar(BuildContext context) {
    if (this.appBar != null) {
      return this.appBar;
    }
    return AppBar(
      title: this.title,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.zero,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    if (this.body != null) {
      return this.body;
    }
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height,
        minWidth: MediaQuery.of(context).size.width,
      ),
      padding: this.padding,
      decoration: BoxDecoration(
        borderRadius: this.radius,
        color: Colors.white,
      ),
      child: this.content,
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
