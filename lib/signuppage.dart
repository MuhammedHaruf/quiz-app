import 'package:flutter/material.dart';
import 'package:newapp/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 211, 88),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 80,
                ),
                TextField(
                   keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: TextStyle(fontSize: 25),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                   onChanged: (value) {
                      Password = value;
                    },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 25),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: Password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => homepage())));
                                  setState(() {
                                  });
                        } catch (e) {
                          print(e);
                        }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 50, 155, 11)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
