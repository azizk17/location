import 'package:flutter/material.dart';

class LeadingIconWidget extends StatelessWidget {
  final IconData icon;
  final String imageUrl;
  final Color color;
  final Color iconColor;

  LeadingIconWidget({this.icon, this.imageUrl, this.color, this.iconColor})
      : assert(icon != null || imageUrl != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      padding: EdgeInsets.all(4),

      child: this.icon != null
          ? Icon(
              this.icon,
              size: 25,
              color: this.iconColor != null ? this.iconColor : Colors.white,
            )
          : Image.asset(this.imageUrl),
      decoration: BoxDecoration(
          color: this.color != null ? this.color : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(7))),
    );
  }
}
