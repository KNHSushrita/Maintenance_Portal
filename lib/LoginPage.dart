import 'package:flutter/material.dart';
import 'package:maintenance_portal_knhs/FailedLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';
import 'Onboarding.dart';
import 'PasswordChangedSuccessfully.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'PasswordChangedSuccessfully.dart';
String username='';
String password='';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: loginPage(),
    );
  }
}
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextStyle style=TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    Text("MAINTENANCE PORTAL");
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
      onChanged: (value) {
        username = value;
      },
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
      onChanged: (value) {
        password = value;
      },
    );
    final loginButton=Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color:Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: login,

        child: Text("Login",
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white,fontWeight: FontWeight.bold),

        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [

                  SizedBox(
                    height: 200.0,
                    child: Image.asset("assets/welcome.png",
                        fit: BoxFit.contain),

                  ),
                  Text("MAINTENANCE PORTAL",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(

                  ),
                  SizedBox(
                      height: 45.0
                  ),
                  emailField,
                  SizedBox(
                      height: 25.0
                  ),
                  passwordField,
                  SizedBox(
                      height: 35.0
                  ),
                  loginButton,
                  SizedBox(
                      height: 15.0
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login()async {

    // String username = unameController.text;
    //
    // String password = pwdController.text;

    print('login attempt: $username with $password');

// _showSnackBar(Text("Please wait while logging you in!"),Color(0xFFff670d));


    getAuth() async {

      print('inside getAuth');

      final response =

      await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-login"),

          headers: {'Content-Type': 'application/json; charset=UTF-8'},

          body: jsonEncode({

            "data": {"username": username, "password": password}

          }));

      var auth_response = jsonDecode(response.body);

      print(auth_response);

      var status = auth_response["E_FLAG"];

      if(status == 1){

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("p_grp",auth_response['E_PLANNER_GROUP']);

        prefs.setString("p_plant",auth_response['E_PLANNING_PLANT']);

        Navigator.push(

            context, MaterialPageRoute(builder: (context) => (MyApp())));

      }else{

// _showSnackBar(Text("Couldn't find your Account. Login with a different account!"),Color(0xFF8C0607));

        print('error');
        Navigator.push(

            context, MaterialPageRoute(builder: (context) => (PasswordChangedSuccessfully1())));

      }

      print(status);

    }





    getAuth();





  }
  void openSuccessPage()
  {
    print(username);
    print(password);
//     fetchlogin(username , password).then((value) {
//       print(value.status);
//       if(value.status == '1'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordChangedSuccessfully()));
  }
//     }
//     else{
//       print ('PassWord Incorrect');
//     }
//   });
//
// }
}