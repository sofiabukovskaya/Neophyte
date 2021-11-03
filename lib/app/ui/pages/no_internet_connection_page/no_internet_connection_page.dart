import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class NoInternetConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Constants.mainLightColor, Constants.mainColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 250),
            Center(
              child: Image.asset(
                "assets/images/no-wifi.png",
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 45),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'No Internet connection. :(\nMake sure that WI-FI or mobile data is turned on, then try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'avenir', fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
