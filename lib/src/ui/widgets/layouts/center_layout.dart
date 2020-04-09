import 'package:location/src/locale.dart';
import 'package:flutter/material.dart';

class CenterLayout extends StatelessWidget {
  final Widget title;
  final Widget logo;
  final List<Widget> childern;
  final Color color;
  final Color boxColor;
  final bool canGoBack;
  final String imgUrl;
  final double imgHeight;
  final double imgWidth;

  CenterLayout(
      {this.title,
      this.logo,
      @required this.childern,
      this.color,
      this.boxColor = Colors.white,
      this.canGoBack = false,
      this.imgUrl,
      this.imgHeight,
      this.imgWidth});

  @override
  Widget build(BuildContext context) {
    //ADD BACK BTN
    return Scaffold(
        backgroundColor: this.color,
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Text(AppLocalizations.of(context).hello),
              onTap: () => null,
            ),
            Text(" - "),
            InkWell(
              child: Text("data2"),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: this.canGoBack
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.teal),
              )
            : null,
        body: _mainLayout(context));
  }

  Widget _logo(BuildContext context) {
    return this.imgUrl == null
        ? Container()
        : ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: this.imgWidth, minHeight: this.imgHeight),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(this.imgUrl),
                fit: BoxFit.fill,
              )),
            ),
          );
  }

  Widget _hed(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[_logo(context), this.title],
    );
  }

  Widget _lightBox(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 1.6,
        maxWidth: MediaQuery.of(context).size.width / 1.13,
        // minHeight: MediaQuery.of(context).size.height / 1,
        // minWidth: MediaQuery.of(context).size.width / 1,
      ),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: this.boxColor,
          borderRadius: BorderRadius.all(Radius.circular(0))),
      child: Column(
        children: this.childern,
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(child: Text("Link one")),
        InkWell(child: Text("Link one")),
      ],
    );
  }

  Widget _mainLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 55),
            _hed(context),
            SizedBox(height: 40),
            Text("HEY MAN"),
            // _lightBox(context),
            // _bottom(context),
          ],
        ),
      ),
    );
  }
}
