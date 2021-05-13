import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testapp/Animation/AnimationBuildLogin.dart';
import 'package:testapp/Ui/SignUpPage.dart';
import 'package:testapp/constants/AuthButton.dart';
import 'package:testapp/constants/TextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
//  ScrollController scrollController;
//   bool dialVisible = true;
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 190.0;
  double widthIcon = 200.0;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();
  Animation<double> _animation;
  AnimationController _animationController;

  getDisposeController() {
    email.clear();
    password.clear();
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    // TODO: implement initState
    super.initState();
    //  scrollController = ScrollController()
    //   ..addListener(() {
    //     setDialVisible(scrollController.position.userScrollDirection ==
    //         ScrollDirection.forward);
    //   });
    getDisposeController();
  }
//  void setDialVisible(bool value) {
//     setState(() {
//       dialVisible = value;
//     });
//   }

  // Widget buildBody() {
  //   return ListView.builder(
  //     controller: scrollController,
  //     itemCount: 30,
  //     itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
  //   );
  // }
  //  SpeedDial buildSpeedDial() {
  //   return SpeedDial(
  //     /// both default to 16
  //     marginEnd: 18,
  //     marginBottom: 20,
  //     // animatedIcon: AnimatedIcons.menu_close,
  //     // animatedIconTheme: IconThemeData(size: 22.0),
  //     /// This is ignored if animatedIcon is non null
  //     icon: Icons.add,
  //     activeIcon: Icons.remove,
  //     // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

  //     /// The label of the main button.
  //     // label: Text("Open Speed Dial"),
  //     /// The active label of the main button, Defaults to label if not specified.
  //     // activeLabel: Text("Close Speed Dial"),
  //     /// Transition Builder between label and activeLabel, defaults to FadeTransition.
  //     // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
  //     /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
  //     buttonSize: 56.0,
  //     visible: true,

  //     /// If true user is forced to close dial manually
  //     /// by tapping main button and overlay is not rendered.
  //     closeManually: false,
  //     curve: Curves.bounceIn,
  //     overlayColor: Colors.black,
  //     overlayOpacity: 0.5,
  //     onOpen: () => print('OPENING DIAL'),
  //     onClose: () => print('DIAL CLOSED'),
  //     tooltip: 'Speed Dial',
  //     heroTag: 'speed-dial-hero-tag',
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.black,
  //     elevation: 8.0,
  //     shape: CircleBorder(),

  //     // orientation: SpeedDialOrientation.Up,
  //     // childMarginBottom: 2,
  //     // childMarginTop: 2,
  //     gradientBoxShape: BoxShape.circle,
  //     gradient: LinearGradient(
  //       begin: Alignment.topCenter,
  //       end: Alignment.bottomCenter,
  //       colors: [Colors.black, Colors.white],
  //     ),
  //     children: [
  //       SpeedDialChild(
  //         child: Icon(Icons.accessibility),
  //         backgroundColor: Colors.red,
  //         label: 'First',
  //         labelStyle: TextStyle(fontSize: 18.0),
  //         onTap: () => print('FIRST CHILD'),
  //         onLongPress: () => print('FIRST CHILD LONG PRESS'),
  //       ),
  //       SpeedDialChild(
  //         child: Icon(Icons.brush),
  //         backgroundColor: Colors.blue,
  //         label: 'Second',
  //         labelStyle: TextStyle(fontSize: 18.0),
  //         onTap: () => print('SECOND CHILD'),
  //         onLongPress: () => print('SECOND CHILD LONG PRESS'),
  //       ),
  //       SpeedDialChild(
  //         child: Icon(Icons.keyboard_voice),
  //         backgroundColor: Colors.green,
  //         label: 'Third',
  //         labelStyle: TextStyle(fontSize: 18.0),
  //         onTap: () => print('THIRD CHILD'),
  //         onLongPress: () => print('THIRD CHILD LONG PRESS'),
  //       ),
  //     ],
  //   );
  // }
  @override
  void dispose() {
    getDisposeController();
    // TODO: implement dispose
    super.dispose();
  }

  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
          // backgroundColor: Colors.grey[200],

          body: Center(
              child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.blueGrey[50], Colors.lightBlue[200]],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: width < 800 ? width : 900,
            height: width < 800 ? height * 1.0 : height * 1.0,
            child: Card(
              shape: width>800?CircleBorder():null,
              elevation: 10,
              child: Container(
                // color: Colors.green,
                width: width < 800 ? width * 0.9 : 800,
                height: width < 800 ? height * 0.9 : height * 0.7,
                child: Row(
                  children: [
                    Container(
                        // color: Colors.deepPurple,
                        child: _loginScreen(),
                        width: width < 800 ? width * 0.97 : 395,
                        height: width < 800 ? height : height),
                    Container(
                      color: Colors.black,
                      width: width < 800 ? null : 1,
                    ),
                    width > 800
                        ? Container(
                            child: Column(children: [
                              _imageWidget(),
                              Container(
                                padding: EdgeInsets.only(bottom: 0),
                                child: Text(
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
                          )
                        : Container(
                            child: _imageWidget(),
                            // color: Colors.yellow,
                            width: width < 800 ? null : 490,
                            height: width < 800 ? height * 0.9 : height * 0.9,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ))
          //  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

          //Init Floating Action Bubble
          ),
    );
  }

  _imageWidget() {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    if (width < 800) {
      return null;
    } else {
      return Lottie.asset(
        'assets/images/56091-people-reading-news-on-phone.json',
        repeat: true,
        reverse: true,
        animate: true,
      );
    }
  }

  _loginScreen() {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
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
//                top: keyboardOpen ? -size.height / 3.2 : 0.0,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / 1.36,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedTextKit(
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        TypewriterAnimatedText('World of Innovations',
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
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
                        hintText: 'Email',
                        obscureText: false,
                        prefixIconData: Icons.mail_outline,
                        textEditingController: email,
                        focusNode: emailFocus,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        textEditingController: password,
                        focusNode: passwordFocus,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 18),
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(
                        top: 40,
                        right: (8),
                        left: (8),
                        bottom: (20),
                      ),
                      child: AuthButton(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // AnimatedContainer(
                //   width: widthIcon,
                //   duration: Duration(seconds: 1),
                //   curve: Curves.linear,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       getAuth(
                //         "assets/images/google.png",
                //         margin: EdgeInsets.only(left: 10.0),
                //       ),
                //       getAuth(
                //         "assets/images/facebook.png",
                //         margin: EdgeInsets.only(right: 80.0),
                //       ),
                //     ],
                //   ),
                // ),
                SignInButton(
                  Buttons.LinkedIn,
                  shape: CircleBorder(),
                  mini: true,
                  onPressed: () {
                    // _showButtonPressDialog(context, 'LinkedIn (mini)');
                  },
                ),
                SignInButton(
                  Buttons.Tumblr,
                  shape: CircleBorder(),
                  mini: true,
                  onPressed: () {
                    // _showButtonPressDialog(context, 'Tumblr (mini)');
                  },
                ),
                SignInButton(
                  Buttons.Facebook,
                  shape: CircleBorder(),
                  mini: true,
                  onPressed: () {
                    // _showButtonPressDialog(context, 'Facebook (mini)');
                  },
                ),
                SignInButtonBuilder(
                  shape: CircleBorder(),
                  icon: Icons.email,
                  text: "Ignored for mini button",
                  mini: true,
                  onPressed: () {
                    // _showButtonPressDialog(context, 'Email (mini)');
                  },
                  backgroundColor: Colors.cyan,
                ),
                InkWell(
                  onTap: () {
                    getDisposeController();
                    Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 800),
                                child: SignUpPage()))
                        .then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        setState(() {
                          width = 190;
                          widthIcon = 200;
                        });
                      });
                    });
                    setState(() {
                      width = 400.0;
                      widthIcon = 0;
                    });
                  },
                  child: AnimatedContainer(
                    height: 50.0,
                    width: width * 0.55,
                    duration: Duration(milliseconds: 1000),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
//                          margin: EdgeInsets.only(right: 8,top: 15),
                                child: Text(
                                  "Not Yet Register ?",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 8,
                                    // letterSpacing: 1,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
//                          margin: EdgeInsets.only(right: 8,top: 15),
                                child: Text(
                                  "Sign Up",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 8,
                                    // letterSpacing: 1,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    curve: Curves.linear,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      gradient: new LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
