import 'package:flutter/material.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:machine_test/widgets/normal_text.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatelessWidget {
  static const String myRoute = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScopedModelDescendant<FirebaseAuthentication>(builder:
            (BuildContext context, Widget child,
                FirebaseAuthentication firebaseAuthentication) {
          return InkWell(
            child: NormalText(firebaseAuthentication.currentUser.displayName),
            onTap: () {
              firebaseAuthentication.signOut();
            },
          );
        }),
      ),
    );
  }
}
