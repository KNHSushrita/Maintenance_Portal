import 'package:flutter/material.dart';
import 'package:maintenance_portal_knhs/HomePage.dart';
// import 'package:maintenance_portal_knhs/NotificationHome.dart';
// import 'package:maintenance_portal_knhs/WorkOrderHome.dart';

import 'LoginPage.dart';
import 'WorkOrderHome.dart';
// import 'package:money_management/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maintenance portal',
      // theme: ThemeData(primarySwatch: Colors.purple),
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {

    // Color primaryColor = Colors.white;

    return Scaffold(
      backgroundColor: Color.fromRGBO(90, 170, 241, 1.0),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // width: double.infinity,

              child: Padding(
                padding: EdgeInsets.only(top: 60.0, right: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.logout),
                      color: Colors.black,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(

                            context, MaterialPageRoute(builder: (context) => (loginPage())));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.black,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(

                            context, MaterialPageRoute(builder: (context) => (MyHomePage())));
                      },
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                // ClipPath(
                //   clipper: CustomShapeClipper(),
                //   child: Container(
                //     height: 350.0,
                //     decoration: BoxDecoration(color: primaryColor),
                //   ),
                // ),


                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'MAINTENANCE PORTAL',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 15.0),
                          // Text(
                          //   'Dashboard',
                          //   style:
                          //   TextStyle(color: Colors.white, fontSize: 14.0),
                          // )
                        ],
                      ),
                      // Material(
                      //   elevation: 1.0,
                      //   borderRadius: BorderRadius.circular(100.0),
                      //   color: Colors.blue[300],
                      //   child: MaterialButton(
                      //     onPressed: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (BuildContext context) => Homepage1()
                      //       ));
                      //     },
                      //     // padding: EdgeInsets.symmetric(
                      //     //     vertical: 10.0, horizontal: 30.0),
                      //     // child: Text(
                      //     //   'TOP UP',
                      //     //   style:
                      //     //   TextStyle(fontSize: 16.0, color: Colors.white),
                      //     // ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.0, right: 25.0, left: 25.0),
                  child: Container(
                    // width: double.infinity,
                    // height: 300.0,
                    // decoration: BoxDecoration(
                    //     // color: Colors.blue,
                    //     color: Color.fromRGBO(6, 186, 239, 1.0),
                    //     // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           // color: Colors.black.withOpacity(0.1),
                    //           // offset: Offset(0.0, 3.0),
                    //           // blurRadius: 15.0
                    //       )
                    //     ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Column(

                                children: <Widget>[

                                  Material(
                                    // child: Image.asset(("assets/welcome.png"),
                                    //     fit: BoxFit.contain),
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white.withOpacity(1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(40.0),
                                      icon: Icon(Icons.notifications_on_sharp),
                                      color: Colors.blue,
                                      iconSize: 40.0,
                                      onPressed: () {
                                        Navigator.push(

                                            context, MaterialPageRoute(builder: (context) => (MyApp1())));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Notification\n',

                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                      fontSize: 20.0),


                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white.withOpacity(1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(40.0),
                                      icon: Icon(Icons.assignment_outlined),
                                      color: Colors.blue,
                                      iconSize: 40.0,
                                      onPressed: () {
                                        Navigator.push(

                                            context, MaterialPageRoute(builder: (context) => (MyApp2())));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('WorkOrder\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                      fontSize: 20.0))
                                ],
                              ),

                              // Container(
                              //
                              //   child: Padding(
                              //     padding: EdgeInsets.only(top: 70.0, left: 210.0),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: <Widget>[
                              //         IconButton(
                              //           icon: Icon(Icons.logout),
                              //           color: Colors.black,
                              //           iconSize: 30.0,
                              //           onPressed: () {
                              //             Navigator.push(
                              //
                              //                 context, MaterialPageRoute(builder: (context) => (MyHomePage())));
                              //           },
                              //         ),
                              //         // SizedBox(height: 8.0),
                              //         // Text('Logout',
                              //         //     style: TextStyle(
                              //         //         color: Colors.white,
                              //         //         // fontWeight: FontWeight.bold,
                              //         //         ))
                              //       ],
                              //     ),
                              //   ),
                              //
                              // )

                              // Column(

                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     // children: <Widget>[
                        //     //   Column(
                        //     //     children: <Widget>[
                        //     //       Material(
                        //     //         borderRadius: BorderRadius.circular(100.0),
                        //     //         color: Colors.pink.withOpacity(0.1),
                        //     //         child: IconButton(
                        //     //           padding: EdgeInsets.all(15.0),
                        //     //           icon: Icon(Icons.monetization_on),
                        //     //           color: Colors.pink,
                        //     //           iconSize: 30.0,
                        //     //           onPressed: () {},
                        //     //         ),
                        //     //       ),
                        //     //       SizedBox(height: 8.0),
                        //     //       Text('Invoice',
                        //     //           style: TextStyle(
                        //     //               color: Colors.black54,
                        //     //               fontWeight: FontWeight.bold))
                        //     //     ],
                        //     //   ),
                        //     //   Column(
                        //     //     children: <Widget>[
                        //     //       Material(
                        //     //         borderRadius: BorderRadius.circular(100.0),
                        //     //         color: Colors.purpleAccent.withOpacity(0.1),
                        //     //         child: IconButton(
                        //     //           padding: EdgeInsets.all(15.0),
                        //     //           icon: Icon(Icons.favorite),
                        //     //           color: Colors.purpleAccent,
                        //     //           iconSize: 30.0,
                        //     //           onPressed: () {},
                        //     //         ),
                        //     //       ),
                        //     //       SizedBox(height: 8.0),
                        //     //       Text('Charity',
                        //     //           style: TextStyle(
                        //     //               color: Colors.black54,
                        //     //               fontWeight: FontWeight.bold))
                        //     //     ],
                        //     //   ),
                        //     //   Column(
                        //     //     children: <Widget>[
                        //     //       Material(
                        //     //         borderRadius: BorderRadius.circular(100.0),
                        //     //         color: Colors.deepPurple.withOpacity(0.1),
                        //     //         child: IconButton(
                        //     //           padding: EdgeInsets.all(15.0),
                        //     //           icon: Icon(Icons.attach_money),
                        //     //           color: Colors.deepPurple,
                        //     //           iconSize: 30.0,
                        //     //           onPressed: () {},
                        //     //         ),
                        //     //       ),
                        //     //       SizedBox(height: 8.0),
                        //     //       Text('Loan',
                        //     //           style: TextStyle(
                        //     //               color: Colors.black54,
                        //     //               fontWeight: FontWeight.bold))
                        //     //     ],
                        //     //   )
                        //     // ],
                        //   ),
                        // ),
                        SizedBox(height: 5.0),
                        // Divider(),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // Expanded(
                              //   child: Text(
                              //     'Click The Above Button !! Contiue to View Details',
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         color: Colors.grey,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              SizedBox(width: 40.0),
                              Material(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Colors.blueAccent.withOpacity(0.1),
                                // child: IconButton(
                                //   icon: Icon(Icons.arrow_forward_ios),
                                //   color: Colors.blueAccent,
                                //   onPressed: () {},
                                // ),
                              )
                            ],
                          ),
                        )
                      ],

                    ),

                  ),
                ),
              ],
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            //   child: Text(
            //     'Upcoming',
            //     style: TextStyle(
            //         color: Colors.black.withOpacity(0.7),
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20.0),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 35.0, bottom: 25.0),
            //   child: Container(
            //     height: 150.0,
            //     child: ListView(
            //       scrollDirection: Axis.horizontal,
            //       children: <Widget>[
            //         UpcomingCard(
            //           title: 'Cred Card One',
            //           value: 280.0,
            //           color: Colors.purple,
            //         ),
            //         UpcomingCard(
            //           title: 'Cred Card Text Two',
            //           value: 260.0,
            //           color: Colors.blue,
            //         ),
            //         UpcomingCard(
            //           title: 'Cred Card Text Two',
            //           value: 210.0,
            //           color: Colors.orange,
            //         ),
            //         UpcomingCard(
            //           title: 'Cred Card Text Two',
            //           value: 110.0,
            //           color: Colors.pink,
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),

    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
