import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final bool loading;
  final Color color;
  final Function onPressed;
  final bool rounded;
  final Widget child;
  final bool enabled;
  const Btn(
      {this.loading = false,
      this.color,
      this.onPressed,
      this.rounded,
      this.child,
      this.enabled = true})
      : assert(child != null);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      color: this.color != null ? this.color : Theme.of(context).buttonColor,
      child: this.loading ? CircularProgressIndicator() : this.child,
      onPressed: this.enabled && !this.loading ? onPressed : null,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0)),
    );
  }
}
