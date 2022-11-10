import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profileapp/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String userName = '';
  Future<void> getData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

      userName = prefs.getString('username')!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => userName.isEmpty?LoginPage():ProfilePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/logo.jpeg'),
          const SizedBox(height: 10,),
          const Text('Profile App',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
