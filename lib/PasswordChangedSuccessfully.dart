import 'package:flutter/material.dart';
// import 'package:newtotolist/Dashboard.dart';
// import 'package:newtotolist/HomePage.dart';

import 'main.dart';
class PasswordChangedSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: passwordChangedSuccessfully(),
    );
  }
}
class passwordChangedSuccessfully extends StatefulWidget {
  @override
  _passwordChangedSuccessfullyState createState() => _passwordChangedSuccessfullyState();
}

class _passwordChangedSuccessfullyState extends State<passwordChangedSuccessfully> {
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
                    image: AssetImage("asset/image/success.jpg")
                )
            ),
          ),
          Text("Login Successfull !! ", style: TextStyle(
              fontSize: 30,
              color: Colors.green
          ),),
          Text(" \n You have successfully Logged In !!\n Please continue to enter into \n Maintenance Dashboard !", style: TextStyle(
            fontSize: 15,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          Center(
            child: InkWell(
              onTap: openHomePage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.deepOrange
                ),
                child: Text("Continue!!", style: TextStyle(
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
  void openHomePage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
  }
}

