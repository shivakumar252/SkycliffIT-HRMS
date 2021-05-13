import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testapp/Ui/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 7900), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              child: LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
     double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              // height: height*0.21,
              width: 200,
              color: Colors.blueAccent,
            ),
            Container(
              //  padding: EdgeInsets.only(top:50),
              child: Lottie.asset(
                'assets/images/56091-people-reading-news-on-phone.json',
                repeat: true,
                reverse: true,
                animate: true,
                height: height*0.40,
                width: width
              ),
            ),
            Container(
              child: TextLiquidFill(
                text: 'SkyCliff IT',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
