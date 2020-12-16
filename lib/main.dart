import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_repo.dart';
import 'package:machine_test/pages/cart/cart.dart';
import 'package:machine_test/pages/home/bloc/data/home_repo.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';
import 'package:machine_test/pages/home/home.dart';
import 'package:machine_test/pages/login/login.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppTheme.primaryGreenColor));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuthentication firebaseAuthentication =
      new FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return HomeBloc(HomeRepo());
          },
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) {
            return CartBloc(CartRepo());
          },
        ),
      ],
      child: ScopedModel<FirebaseAuthentication>(
        model: firebaseAuthentication,
        child: MaterialApp(
          title: 'Machine Test',
          theme: ThemeData(splashColor: Colors.transparent),
          debugShowCheckedModeBanner: false,
          home: Login(),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Login.myRoute:
                return PageTransition(
                  child: Login(),
                  type: PageTransitionType.rightToLeft,
                  settings: settings,
                );
                break;

              case Home.myRoute:
                return PageTransition(
                  child: Home(),
                  type: PageTransitionType.rightToLeft,
                  settings: settings,
                );
                break;

              case Cart.myRoute:
                return PageTransition(
                  child: Cart(),
                  type: PageTransitionType.rightToLeft,
                  settings: settings,
                );
                break;

              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
