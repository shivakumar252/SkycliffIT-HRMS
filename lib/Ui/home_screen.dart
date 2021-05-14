import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testapp/common/drawer_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerScreen(),
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: ([Colors.blueGrey[50], Colors.lightBlue[200]]),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [ width < 800 ? homeDesign() :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height,
                    width: 350,
                    child: DrawerScreen(),
                  ),
                  Container(
                    height: height,
                    width: 500,
                    child: homeDesign(),
                  ),
                ],
              ),
            ],
          )
        )
      ),
    );
  }

  Widget homeDesign(){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.96,
      width: width < 800 ? width : 850,
      color: Color.fromRGBO(231, 233, 242, 1),
      child: Column(
        children: [
          Container(
              height: width < 800 ? height * 0.35 : height * 0.34,
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [Colors.blue, Colors.blueGrey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(width < 800 ?width : 850,150.0)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      width < 800 ? IconButton(
                        icon: Icon(Icons.menu,color: Colors.white,size: 30,),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ):Container(),
                      Text("Welcome, Adarsh",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                      IconButton(
                        icon: Icon(Icons.notifications,color: Colors.white,size: 30,),
                        onPressed: (){},
                      )
                    ],
                  ),
                  Container(
                      child: Lottie.asset('assets/images/59446-black-guy-animation.json',height: 140,width: 160)
                  ),
                ],
              )
          ),
          FractionalTranslation(
            translation: width < 800 ? Offset(0.0, -0.5): Offset(0.0, -0.3),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: width < 800 ? width * 0.9 : 500 * 0.9,
                height: 110,
                child: Center(
                  child: ListTile(
                    title: Text("Punch In",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("You haven't punched yet"),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightBlueAccent[400],
                      ),
                      width: 50,
                      height: 50,
                      child: Icon(Icons.touch_app_outlined,size: 30,color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FractionalTranslation(
            translation:width < 800 ? Offset(0.0, -0.4): Offset(0.0, -0.2),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: width < 800 ? width * 0.9 : 500 * 0.9,
                height: 110,
                child: Center(
                  child: ListTile(
                    title: Text("Today's Tasks",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Check your tasks"),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightBlueAccent[400],
                      ),
                      width: 50,
                      height: 50,
                      child: Icon(Icons.message,size: 30,color: Colors.white,),
                    )
                  ),
                ),
              ),
            ),
          ),
          FractionalTranslation(
            translation: width < 800 ? Offset(0.0, -0.3): Offset(0.0, -0.1),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: width < 800 ? width * 0.9 : 500 * 0.9,
                height: 110,
                child: Center(
                  child: ListTile(
                    title: Text("Today's Meetings",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Check your meetings"),
                    trailing:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightBlueAccent[400],
                      ),
                      width: 50,
                      height: 50,
                      child: Icon(Icons.meeting_room_outlined,size: 30,color: Colors.white,),
                    )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
