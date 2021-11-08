import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ganda_vibes/src/app/services/authentication.service.dart';
import 'package:ganda_vibes/src/app/pages/home.page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'src/app/pages/signup.page.dart';
import 'src/utils/models/user.model.dart';

void main() async {
  var logger = Logger();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().catchError((e) {
    logger.e(e);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        StreamProvider.value(value: AuthProvider().user, initialData: null)
      ],
      child: MaterialApp(
        home: Authenticate(),
      ),
    );
  }
}



class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return SignUp();
    } else {
      print(user.uid);
      return HomePage();
    }
  }
}