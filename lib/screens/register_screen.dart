import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskproject/screens/login_screen.dart';
import 'package:taskproject/screens/movies_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController enteredEmail = TextEditingController();
  TextEditingController enteredPassword = TextEditingController();
  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register Screen',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
                controller: enteredEmail,
                decoration: InputDecoration(labelText: 'Email:')),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: enteredPassword,
              decoration: InputDecoration(labelText: 'Password:'),
            ),
            SizedBox(
              height: 25.0,
            ),
            OutlinedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (enteredEmail.text == '' || enteredPassword.text == '') {
                  return;
                } else {
                  prefs.setString(
                      'userEmail', enteredEmail.text.toString().trim());
                  prefs.setString(
                      'userPassword', enteredPassword.text.toString().trim());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MoviesScreen();
                    },
                  ));
                }
              },
              child: Text('Register!'),
            ),
            SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ));
              },
              child: Text(
                'Already have an account!!',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
