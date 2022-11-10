import 'package:flutter/material.dart';
import 'package:profileapp/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  addData() async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('username', userNameController.text);
    _prefs.setString('password', passwordController.text);

  }



  final _formKey = GlobalKey<FormState>();

  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter UserName';
                        }
                        // if(!value.contains('@')){
                        //   return 'Please Enter a valid email';
                        // }
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)){
                          return 'Please Enter a valid email';
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('UserName'),
                          hintText: 'Enter Username'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        if(value.length <8){
                          return 'Password must have 8 characters';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'password must contain alphabets, numbers and special characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Password'),
                          hintText: 'Enter Password'),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            ProfilePage(),));
                      }
                    }, child: Text('Login'))

                  ],
                )),
                    ],
        ),
      ),
    );
  }
}
