import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:testapp/Ui/login.dart';
import 'package:testapp/common/Splash.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  bool isWeb() {
    return kIsWeb;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: kIsWeb ? LoginScreen():SplashScreen()
    );
  }
}
