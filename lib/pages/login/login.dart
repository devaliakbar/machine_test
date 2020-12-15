import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/home.dart';
import 'package:machine_test/pages/login/widgets/partials/phone_enter_dialogue.dart';
import 'package:machine_test/pages/login/widgets/partials/sms_enter_dialogue.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/custom_icon_button.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
              child: ScopedModelDescendant<FirebaseAuthentication>(
                builder: (BuildContext context, Widget child,
                    FirebaseAuthentication firebaseAuthentication) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 11),
                        child: CustomIconButton(
                          text: "Google",
                          imageIconPath: "assets/images/google-icon.png",
                          backgroundColor: AppTheme.blueColor,
                          onPressed: () => firebaseAuthentication
                              .signInWithGoogle(loginResult: loginResult),
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
                          onPressed: () => phoneEnterDialogue(
                            context: context,
                            verifyNumber: (String phone) {
                              firebaseAuthentication.signInWithPhone(
                                phone: phone,
                                loginResult: loginResult,
                                enterSmsCode: (
                                    {@required Function verifyPhone,
                                    @required String verificationId}) {
                                  smsEnterDialogue(
                                    context: context,
                                    verifyOTP: (String enteredOtp) =>
                                        verifyPhone(
                                      {
                                        verificationId: verificationId,
                                        enteredOtp: enteredOtp,
                                        loginResult: loginResult
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void loginResult(bool success) {
    if (success != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return ();
      //     },
      //   ),
      // );
    }
  }
}
