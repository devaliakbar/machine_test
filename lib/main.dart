import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/pages/login/login.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuthentication firebaseAuthentication =
      new FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<FirebaseAuthentication>(
      model: firebaseAuthentication,
      child: MaterialApp(
        title: 'Machine Test',
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
