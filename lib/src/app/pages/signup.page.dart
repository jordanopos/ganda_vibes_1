import 'package:flutter/material.dart';
import 'package:ganda_vibes/src/app/services/authentication.service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: firstnamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your First Name',
                labelText: 'First Name',
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: lastnamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your Last Name',
                labelText: 'Last name',
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your Email',
                labelText: 'Email',
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: passwordcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your Password',
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('SIGN UP'),
                onPressed: () {
                
                  context.read<AuthProvider>().signUp(
                      firstnamecontroller.text,
                      lastnamecontroller.text,
                      emailcontroller.text,
                      passwordcontroller.text,
                      context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
