import 'package:flutter/material.dart';
import 'package:maintenance_portal_knhs/HomePage.dart';
import 'package:maintenance_portal_knhs/LoginPage.dart';
class PasswordChangedSuccessfully1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: passwordChangedSuccessfully1(),
    );
  }
}
class passwordChangedSuccessfully1 extends StatefulWidget {
  @override
  _passwordChangedSuccessfullyState createState() => _passwordChangedSuccessfullyState();
}

class _passwordChangedSuccessfullyState extends State<passwordChangedSuccessfully1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/failed.jpg")
                )
            ),
          ),
          Text("Login Failed", style: TextStyle(
              fontSize: 30,
              color: Colors.black
          ),),
          Text("Try Again with Valid credentials.\n\n Note: Username and password are mandatory fields "  , style: TextStyle(
            fontSize: 15,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          Center(
            child: InkWell(
              onTap: openLoginPage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.blue
                ),
                child: Text("Ok", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void openLoginPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}

