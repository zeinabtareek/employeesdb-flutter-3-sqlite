import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  VoidCallback onPressed ;
  IconData icon ;
  Color colorOfIcon;
    CustomIconButton({
    this.onPressed,
    this.icon,
    this.colorOfIcon,
    Key key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon,color: colorOfIcon),
        onPressed: onPressed

    );
  }
}