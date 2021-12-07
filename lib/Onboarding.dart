import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'LoginPage.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: onboarding(),
    );
  }
}
class onboarding extends StatefulWidget {

  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
      initialPage: 0,
      keepPage: true
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.9,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard3", "Welcome To Maintenance Portal"),

                  ],
                  onPageChanged: (value)=>{setCurrentPage(value)},
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0,9),
                              blurRadius: 20,
                              spreadRadius: 3
                          )]

                      ),
                      child: Text("Get Started", style: TextStyle(
                        fontSize: 20  ,
                        color:Colors.white,
                      ),),
                    ),
                  ),
                  // SizedBox(height: 30,),
                  // Text("Login", style: TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold
                  // ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  AnimatedContainer getIndicator(int pageNo)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Colors.black : Colors.grey
      ),
    );
  }
  Column onBoardPage(String img, String title)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),

        SizedBox(height: 50,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500
          ),),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/welcome.png")
              )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text("To keep connected with us , Please Get started ", style: TextStyle(
              fontSize: 18,
              color: Colors.black
          ),textAlign: TextAlign.center,),
        )
      ],
    );
  }
  setCurrentPage(int value)
  {
    currentPage = value;
    setState(() {

    });
  }
  openLoginPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}
