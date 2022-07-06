import 'package:flutter/material.dart';

class RoundButtonIcon extends StatelessWidget {
  RoundButtonIcon({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}