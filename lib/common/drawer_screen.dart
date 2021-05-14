import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [Colors.blueGrey, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text(
                "Adarsh K", overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("adarsh@gmail.com",),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/default_user.png',),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_rounded),
              title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.airplanemode_active),
              title: Text("Leaves",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.receipt_long_outlined),
              title: Text("Payslips",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text("Expenses",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Projects",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Tasks",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
