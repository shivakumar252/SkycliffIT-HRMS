import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testapp/Animation/AnimationBuildLogin.dart';
import 'package:testapp/constants/ColorGlobal.dart';
import 'package:testapp/constants/TextField.dart';


class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() {
    return new SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 400.0;
  double widthIcon = 200.0;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  FocusNode nameFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        width = 190.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
        body:Center(
            child: Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.blueGrey[50], Colors.lightBlue[200]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ) ,
       child: Center(
          child: Container(
            width: width < 800 ? width : 900,
            height: width < 800 ? height * 1.0: height * 1.0,
            child: Card(
              shape: width > 800 ?CircleBorder():null,
              elevation: 10,
              child: Container(
                // color: Colors.green,
                width: width < 800 ? width * 0.9 : 800,
                height: width < 800 ? height * 0.9 : height * 0.7,
                child: Row(
                  children: [
                   width>800? Container(
                    child: Column(children: [
                      
                      _imageWidget(),
                      Container(
                        padding:EdgeInsets.only(bottom:0),
                        child:  
                         Text(
                          "SkyCliff IT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.blueAccent),
                        ),
                      )
                    ]),

                    // color: Colors.yellow,
                    width: width < 800 ? null : 490,
                    height: width < 800 ? height * 0.9 : height * 0.9,
                  ): Container(
                    child: 
                      _imageWidget(),
                    // color: Colors.yellow,
                    width: width < 800 ? null : 490,
                    height: width < 800 ? height * 0.9 : height * 0.9,
                  ),
                    Container(
                      // color: Colors.deepPurple,
                      child: _registerScreen(),
                      width: width < 800 ? width * 0.96 : 400,
                      height: width < 800 ? height : height 
                    ),
                    Container(
                      color: Colors.black,
                      width: width < 800 ? null : 1,
                    ),
                 
                  ],
                ),
              ),
            ),
          ),
        ),
            )
        )
      ),
    );
  }

  _imageWidget() {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    if (width < 800) {
      return null;
    } else {
      return
    Lottie.asset(
   'assets/images/56091-people-reading-news-on-phone.json',
    repeat:  true,
    reverse: true,
    animate: true,
);
    }
  }

  _registerScreen() {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorGlobal.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(),
                height: size.height,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Colors.blue, Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / 1.26,
                  color: ColorGlobal.whiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                              'assets/images/logo.png',
                      height: 100,
                      width: 100,
                      color: ColorGlobal.whiteColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Create Account !',
                      style: TextStyle(
                        color: ColorGlobal.whiteColor,
                        fontSize: 14.0,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 22,
                  left: 22,
                  bottom: 22,
                  top: 130,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Name',
                        obscureText: false,
                        prefixIconData: Icons.account_circle,
                        textEditingController: name,
                        focusNode: nameFocus,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Email',
                        obscureText: false,
                        prefixIconData: Icons.email,
                        textEditingController: email,
                        focusNode: emailFocus,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        focusNode: passwordFocus,
                        textEditingController: password,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 400),
                                child: SignUpPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: (40),
                          right: (8),
                          left: (8),
                          bottom: (20),
                        ),
                        height: (50.0),
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              ColorGlobal.whiteColor,
                              ColorGlobal.whiteColor.withOpacity(0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorGlobal.colorPrimary.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 20,
                              // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            width: 2,
                            color: ColorGlobal
                                .colorPrimaryDark, //                   <--- border width here
                          ),
                          color: ColorGlobal.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              (22.0),
                            ),
                          ),
                        ),
                        child: Container(
//                        margin: EdgeInsets.only(left: (10)),
                          alignment: Alignment.center,
                          child: Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: ColorGlobal.colorPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.only(top: 10),
        color: ColorGlobal.whiteColor,

        height: 48,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(
                        context,
                        PageTransition(
                          child: null,
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 800),
                        ));
                    setState(() {
                      width = 500;
                      widthIcon = 0;
                    });
                  },
                  child: AnimatedContainer(
                    height: 40.0,
                    width: width * 0.72,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.linear,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
//                          margin: EdgeInsets.only(right: 8,top: 15),
                                child: Text(
                                  "Have an Account",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 1,
                                    color:
                                        ColorGlobal.whiteColor.withOpacity(0.9),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
//                          margin: EdgeInsets.only(right: 8,top: 15),
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 1,
                                    color:
                                        ColorGlobal.whiteColor.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorGlobal.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      gradient: new LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey],
                      ),
                    ),
                  ),
                ),
                // AnimatedContainer(
                //   width: widthIcon,
                //   duration: Duration(seconds: 1),
                //   curve: Curves.linear,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       getAuth(
                //         "assets/Images/google.png",
                //         margin: EdgeInsets.only(left: 45),
                //       ),
                //       SizedBox(
                //         width:5
                //       ),
                //       getAuth(
                //         "assets/Images/facebook.png",
                //         margin: EdgeInsets.only(right: 50.0),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}