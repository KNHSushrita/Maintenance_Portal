// import 'package:flutter/material.dart';
// import 'package:newtotolist/Dashboard.dart';
// import 'package:newtotolist/HomePage.dart';
// import 'package:newtotolist/WorkOrderList.dart';
// import 'CreateWorkOrder.dart';
// import 'LoginPage.dart';
// import 'NotificationHome.dart';
//
// class HomePage2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           fontFamily: 'avenir'
//       ),
//       home: homePage2(),
//     );
//   }
// }
// class homePage2 extends StatefulWidget {
//   @override
//   _homePageState createState() => _homePageState();
// }
//
// class _homePageState extends State<homePage2> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // SizedBox(height: 50),
//               AppBar(
//
//                 backgroundColor: Colors.blue,
//                 elevation: 0,
//                 title: Text("Work Order", style: TextStyle(
//                   fontSize: 30,
//                 ),),
//                 actions: [
//                   IconButton(
//                     icon: Icon(Icons.toggle_on_sharp,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//                     onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>(MyApp())));},
//
//                   )
//                 ],
//
//               ),
//
//
//               Container(
//                 height: 70,
//                 color: Colors.blue,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // InkWell(
//                         //   child: Text("", style: TextStyle(
//                         //       color: Colors.white,
//                         //       fontSize: 18
//                         //   ),),
//                         // ),
//                         SizedBox(height: 10,),
//                         Container(
//                           height: 4,
//                           width: 120,
//                         )
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 15,
//                     crossAxisSpacing: 10,
//                     primary: false,
//
//                     children: <Widget>[
//                       Card(
//                         shape: RoundedRectangleBorder(
//
//                             borderRadius: BorderRadius.circular(10)),
//                         color: Color(0xbc4c27a3),
//                         elevation: 1,
//                         child: Container(
//
//                           child: IconButton(
//                             tooltip: 'WorkOrder List',
//                             icon: Icon(
//                               Icons.list_alt_sharp,
//                             ),
//                             iconSize: 30,
//                             color: Colors.white,
//                             splashColor: Colors.purple,
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomeWpage()));
//                             },
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: Color(0xbc4c27a3),
//                         elevation: 1,
//                         child: Container(
//                           child: IconButton(
//                             tooltip: 'Create Wokr Order',
//                             icon: Icon(
//                               Icons.add_comment_rounded,
//                             ),
//                             iconSize: 30,
//                             color: Colors.white,
//                             splashColor: Colors.purple,
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => MyWorkCreate()));
//                             },
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: Color(0xbc4c27a3),
//                         elevation: 1,
//                         child: Container(
//                           child: IconButton(
//                             tooltip: 'Notification',
//                             icon: Icon(
//                               Icons.notifications_on_outlined,
//                             ),
//                             iconSize: 30,
//                             color: Colors.white,
//                             splashColor: Colors.purple,
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => MyApp()));
//                             },
//                           ),
//                         ),
//                       ),
//                     ],)),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10,),
//                       Container(
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//
//                         ),
//                       ),
//                       // taskWidget('data'),
//
//                     ],
//
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 110,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         height: 90,
//                         width: MediaQuery.of(context).size.width,
//                         color: Color(0xff292e4e),
//                         padding: EdgeInsets.all(20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//
//                             Container( width:80,
//                               child: Column(
//
//                                 children: [
//
//                                   Icon(
//                                     Icons.menu,
//                                     color: Colors.white,
//                                   ),
//                                   SizedBox(height:5,),
//                                   InkWell(
//                                     onTap: openWoListPage,
//
//                                     child:Container(
//
//
//                                       child:Text("List View", style: TextStyle(
//                                           color: Colors.white,
//
//                                           fontSize: 15
//                                       ),
//                                       ),),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//
//                             Container(width: 90,),
//
//                             Container(
//                               child: Column(
//                                 children: [
//                                   Icon(
//                                     Icons.logout,
//                                     color: Colors.white,
//                                   ),
//                                   SizedBox(height: 5,),
//                                   InkWell(
//                                     onTap: openLoginPage,
//
//                                     child:Container(
//
//
//                                       child:Text("Logout", style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15
//                                       ),),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 25,
//                       left: 0,
//                       right: 0,
//
//                       child: Container(
//                         height: 80,
//                         width: 80,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topRight,
//                               end: Alignment.bottomLeft,
//                               colors: [Colors.blue, Colors.purple],
//                             ),
//                             shape: BoxShape.circle
//                         ),
//                         child: Center(
//                           child: InkWell(
//                             onTap: openCreateWo,
//                             child: Text("+", style: TextStyle(
//                                 fontSize: 40,
//                                 color: Colors.white
//                             ),),
//                           ),
//                         ),
//                       ),
//
//                     ) ],
//                 ),
//               )
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   void openWoListPage()
//   {
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeWpage()));
//   }
//   openLoginPage()
//   {
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
//   }
//   openCreateWo(){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWorkCreate()));
//
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:maintenance_portal_knhs/Dashboard.dart';
import 'package:maintenance_portal_knhs/HomePage.dart';
import 'package:maintenance_portal_knhs/NotificationHome.dart';
import 'package:maintenance_portal_knhs/WorkOrderHome.dart';

import 'CreateNotification.dart';
import 'CreateWorkOrder.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'WorkOrderList.dart';
// import 'package:money_management/dashboard.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      // theme: ThemeData(primarySwatch: Colors.purple),
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
    // Color primaryColor = Color.fromRGBO(255, 82, 48, 1);

    return Scaffold(
      // backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      // backgroundColor: Color.fromRGBO(174, 211, 243, 1.0),
      backgroundColor: Color.fromRGBO(90, 170, 241, 1.0),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // width: double.infinity,
              // decoration: BoxDecoration(
              //     color: primaryColor, border: Border.all(color: primaryColor)
              // ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(

                            context, MaterialPageRoute(builder: (context) => (MyApp())));
                      },
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.notifications_none),
                    //   color: Colors.white,
                    //   iconSize: 30.0,
                    //   onPressed: () {},
                    // )
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
                            'WORKORDER',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0),
                          // Text(
                          //   'Details',
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
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 10.0, horizontal: 30.0),
                      //     child: Text(
                      //       'TOP UP',
                      //       style:
                      //       TextStyle(fontSize: 16.0, color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.chrome_reader_mode_rounded),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(

                                            context, MaterialPageRoute(builder: (context) => (HomeWpage())));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('View List',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.create_new_folder_outlined),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(

                                            context, MaterialPageRoute(builder: (context) => (MyWorkCreate())));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Create',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              // Column(
                              //   children: <Widget>[
                              //     Material(
                              //       borderRadius: BorderRadius.circular(100.0),
                              //       color: Colors.orange.withOpacity(0.1),
                              //       child: IconButton(
                              //         padding: EdgeInsets.all(15.0),
                              //         icon: Icon(Icons.receipt),
                              //         color: Colors.orange,
                              //         iconSize: 30.0,
                              //         onPressed: () {
                              //           Navigator.push(
                              //
                              //               context, MaterialPageRoute(builder: (context) => (loginPage())));
                              //         },
                              //       ),
                              //     ),
                              //     SizedBox(height: 8.0),
                              //     Text('Logout',
                              //         style: TextStyle(
                              //             color: Colors.black54,
                              //             fontWeight: FontWeight.bold))
                              //   ],
                              // )
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
                        // SizedBox(height: 10.0),
                        // Divider(),
                        // SizedBox(height: 15.0),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Text(
                        //           'Lorem ipsum dolor sit amet dan aku tan moyan',
                        //           textAlign: TextAlign.left,
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),
                        //       SizedBox(width: 40.0),
                        //       Material(
                        //         borderRadius: BorderRadius.circular(100.0),
                        //         color: Colors.blueAccent.withOpacity(0.1),
                        //         // child: IconButton(
                        //         //   icon: Icon(Icons.arrow_forward_ios),
                        //         //   color: Colors.blueAccent,
                        //         //   onPressed: () {},
                        //         // ),
                        //       )
                        //     ],
                        //   ),
                        // )
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
            // Container(
            //   height: 380,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         bottom: 0,
            //         child: Container(
            //           height: 70,
            //           width: MediaQuery.of(context).size.width,
            //           color: Color(0xF3FAFDFD),
            //           padding: EdgeInsets.all(10),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //
            //               Container( width:80,
            //                 child: Column(
            //
            //                   children: [
            //
            //                     Icon(
            //                       Icons.home,
            //                       color: Colors.black,
            //                     ),
            //                     SizedBox(height:5,),
            //                     InkWell(
            //                       onTap: openHomePage,
            //
            //                       child:Container(
            //
            //
            //                         child:Text("Home", style: TextStyle(
            //                             color: Colors.black,
            //
            //                             fontSize: 15
            //                         ),
            //                         ),),
            //                     ),
            //                   ],
            //
            //                 ),
            //               ),
            //
            //               Container(width: 90,),
            //
            //               Container(
            //                 child: Column(
            //                   children: [
            //                     Icon(
            //                       Icons.logout,
            //                       color: Colors.black,
            //                     ),
            //                     SizedBox(height: 5,),
            //                     InkWell(
            //                       onTap: openLoginPage,
            //
            //                       child:Container(
            //
            //
            //                         child:Text("Logout", style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: 15
            //                         ),),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       // Positioned(
            //       //   bottom:20,
            //       //   left: 0,
            //       //   right: 0,
            //       //
            //       //   child: Container(
            //       //     height: 70,
            //       //     width: 70,
            //       //     decoration: BoxDecoration(
            //       //         gradient: LinearGradient(
            //       //           begin: Alignment.topRight,
            //       //           end: Alignment.bottomLeft,
            //       //           colors: [Colors.orangeAccent, Colors.redAccent],
            //       //         ),
            //       //         shape: BoxShape.circle
            //       //     ),
            //       //     child: Center(
            //       //       child: InkWell(
            //       //         onTap: openHomePage,
            //       //         child: Text("🏠", style: TextStyle(
            //       //             fontSize: 25,
            //       //             color: Colors.white
            //       //         ),),
            //       //       ),
            //       //     ),
            //       //   ),
            //       //
            //       // )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  void openHomePage() {
    Navigator.push(

        context, MaterialPageRoute(builder: (context) => (MyApp())));
  }

  void openLoginPage() {
    Navigator.push(

        context, MaterialPageRoute(builder: (context) => (loginPage())));
  }

  openNotification() {
    Navigator.push(

        context, MaterialPageRoute(builder: (context) => (MyHomePage())));
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