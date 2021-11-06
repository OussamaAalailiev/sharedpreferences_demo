import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name="";

  String email="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getUserEmail();
    print('initState() --> WelcomeScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the app!'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('Your name is: '+name),
            ),
            ListTile(
              title: Text('Your email is: '+email),
            )
          ],
        ),
      ),
    );
  }

  void getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')?? 'User not found!';
    });
    // if (name == null) {
    //   return 'null';
    // } else {
    //   return name;
    // }
  }

  void getUserEmail() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email')?? 'Email not found!';
    });
    // if (email == null) {
    //   return 'null';
    // } else {
    //   return email;
    // }
  }
}
