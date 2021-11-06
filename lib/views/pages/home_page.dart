import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_demo/views/pages/welcome_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title, }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name;

  String? email;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // storeUserName(name);
    // storeUserEmail(email);
    getUserName();
    getUserEmail();
    print('initState() --> MyHomePage');
   // getUserData();
  }

  // void _loadNameANDEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   name=prefs.getString('name').toString();
  //   email=prefs.getString('email').toString();
  // }

  getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')?? 'User not found!';
    // if (name == null) {
    //   return 'null';
    // } else {
    //   return name;
    // }
  }

  getUserEmail() async{
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')?? 'Email not found!';
    // if (email == null) {
    //   return 'null';
    // } else {
    //   return email;
    // }
  }
  @override
  Widget build(BuildContext context) {
    print('build() -->HomePage() is called............');
    return Scaffold(
      appBar: AppBar(title:
      Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name'),
            Text('$email'),
            Container(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _nameController,
                // onChanged: (value) async{
                //   name=value;
                //   final prefs = await SharedPreferences.getInstance();
                //   name=prefs.setString('name', name ?? '') as String;
                //   prefs.getString('name');
                //   print('prefs of name stored..............$name');
                // },
                decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter a name',
                    icon: Icon(Icons.person)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _emailController,
                // onChanged: (value) async{
                //   email=value;
                //   final prefs = await SharedPreferences.getInstance();
                //   email=prefs.setString('email', email ?? '') as String?;
                //   prefs.getString('name');
                //   print('prefs of email stored..............$email');
                // },
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'xyz@example.com',
                    icon: Icon(Icons.email_outlined)
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                   getUserName();
                   getUserEmail();
                  });
             //    if(name=!null){
                //  setState(() {
                    storeUserName(_nameController.text);
                    storeUserEmail(_emailController.text);
                //  });

                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => WelcomeScreen(),)
                   );
           //      }

                  // storeUserData(_nameController.text);
                  // storeUserData(_emailController.text);

                  // final prefs = await SharedPreferences.getInstance();
                  // email=prefs.setString('email', _emailController.text).toString();
                  // name= prefs.setString('name', _nameController.text).toString();

                  // print(prefs.getString('name'));
                  // print(prefs.getString('email'));
                  print('SharedPreferences Returned ............$name AND $email');
                },
                child: const Text(
                  'Submit', style: TextStyle(color: Colors.amber),)
            )
          ],
        ),
      ),
    );
  }

  // Future<void> storeUserData(newValue) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('name', newValue);
  //   prefs.setString('email', newValue);
  // }
  Future<void> storeUserName(newValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', newValue ?? 'name NOT here');
  }
  Future<void> storeUserEmail(newValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', newValue ?? 'email NOT here');
  }

  // getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   name = prefs.getString('name');
  //   email = prefs.getString('email');
  //   if ((name == null && email == null)) {
  //     return 'null';
  //   } else {
  //     return '$name, $email';
  //   }
  // }

}