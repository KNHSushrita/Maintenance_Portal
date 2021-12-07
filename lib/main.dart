import 'dart:async';
import 'package:flutter/material.dart';
import 'Onboarding.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState() {

    Timer(Duration(seconds: 1), openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   // image: AssetImage('asset/image/not.jpg'),
              // )
          ),
        ),
      ),
    );
  }
  void openOnBoard()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
  }
}

