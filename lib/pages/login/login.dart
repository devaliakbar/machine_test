import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/home.dart';
import 'package:machine_test/pages/login/widgets/partials/phone_enter_dialogue.dart';
import 'package:machine_test/pages/login/widgets/partials/sms_enter_dialogue.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/custom_icon_button.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  static const String myRoute = '/login';
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          isLoading: _isLoading,
                          imageIconPath: "assets/images/google-icon.png",
                          backgroundColor: AppTheme.blueColor,
                          onPressed: () {
                            firebaseAuthentication.signInWithGoogle(
                                loginResult: loginResult);
                            if (mounted) {
                              setState(() {
                                _isLoading = true;
                              });
                            }
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
                          isLoading: _isLoading,
                          backgroundGradient: LinearGradient(
                            colors: <Color>[
                              AppTheme.secondaryGreenColor,
                              AppTheme.primaryGreenColor
                            ],
                          ),
                          onPressed: () => phoneEnterDialogue(
                            context: context,
                            verifyNumber: (String phone) {
                              if (mounted) {
                                setState(() {
                                  _isLoading = true;
                                });
                              }

                              firebaseAuthentication.signInWithPhone(
                                phone: phone,
                                loginResult: loginResult,
                                enterSmsCode: (
                                        {@required Function verifyPhone,
                                        @required String verificationId}) =>
                                    smsEnterDialogue(
                                  context: context,
                                  verifyOTP: (String enteredOtp) {
                                    verifyPhone(
                                      {
                                        verificationId: verificationId,
                                        enteredOtp: enteredOtp,
                                        loginResult: loginResult
                                      },
                                    );
                                  },
                                ),
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
    if (success) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Verified Successfully'),
        duration: Duration(seconds: 2),
      ));

      Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.of(context).pushNamedAndRemoveUntil(
              Home.myRoute, (Route<dynamic> route) => false));

      return;
    }

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Failed to Verify'),
      duration: Duration(microseconds: 500),
    ));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
