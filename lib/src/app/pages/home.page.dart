import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var logger = Logger();
    //! yoo material app should only be put at the root of the application in main.dart

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('LOG OUT'),
          onPressed: () {},
        ),
      ),
    );
  }
}
