import 'package:flutter/material.dart';
import 'package:profileapp/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = '';
  String password = '';
  Future<void> getData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username')!;
      password = prefs.getString('password')!;
    });
  }

  removeData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Container(
                   height: 100,
                   width: 100,
                   child: Image.network('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',isAntiAlias: true,fit: BoxFit.cover,),

               ),
              Text(userName,style: TextStyle(fontSize: 28),),
              Text(password,style: TextStyle(fontSize: 28),),
              Text('Address',style: TextStyle(fontSize: 28),),

              ElevatedButton(onPressed: (){
                removeData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('LogOut'))

            ],
          ),
        ),
    );
  }
}
