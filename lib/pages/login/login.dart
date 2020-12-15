import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/home.dart';
import 'package:machine_test/services/firebase/google_sign_in.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/custom_icon_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Image.asset("assets/images/firebase.png"),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 11),
                    child: CustomIconButton(
                      text: "Google",
                      imageIconPath: "assets/images/google-icon.png",
                      backgroundColor: AppTheme.blueColor,
                      onPressed: () {
                        //TODO
                        // signInWithGoogle().then((result) {
                        //   if (result != null) {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return Home();
                        //         },
                        //       ),
                        //     );
                        //   }
                        // });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomIconButton(
                      text: "Phone",
                      icon: Icons.phone,
                      backgroundGradient: LinearGradient(
                        colors: <Color>[
                          AppTheme.secondaryGreenColor,
                          AppTheme.primaryGreenColor
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
