import 'package:flutter/material.dart';
import 'package:profileapp/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              Text('username',style: TextStyle(fontSize: 28),),
              Text('password',style: TextStyle(fontSize: 28),),
              Text('Address',style: TextStyle(fontSize: 28),),

              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('LogOut'))

            ],
          ),
        ),
    );
  }
}
