import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class LinearButton extends StatelessWidget {
  const LinearButton({Key? key, required this.buttonTitle, required this.onTap})
      : super(key: key);

  final String buttonTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: onTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Constants.mainColor, Constants.mainLightColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'avenir', color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
