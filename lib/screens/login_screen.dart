import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskproject/screens/movies_screen.dart';
import 'package:taskproject/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              'Login Screen',
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
                  if (prefs.getString('userEmail') ==
                          enteredEmail.text.trim() &&
                      prefs.getString('userPassword') ==
                          enteredPassword.text.trim()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return MoviesScreen();
                      },
                    ));
                  }
                }
              },
              child: Text(
                'login',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ));
              },
              child: Text(
                'Dont have an account!!',
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
