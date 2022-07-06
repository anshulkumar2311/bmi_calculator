import 'package:flutter/material.dart';
import 'constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style:  buttonStyle,)),
        color: Colors.red,
        padding: EdgeInsets.only(bottom: 5.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}