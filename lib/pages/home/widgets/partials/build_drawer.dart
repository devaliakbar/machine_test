import 'package:flutter/material.dart';
import 'package:machine_test/pages/login/login.dart';
import 'package:machine_test/services/firebase/firebase_authentication.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';
import 'package:scoped_model/scoped_model.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Drawer(
        child: SafeArea(
          child: ScopedModelDescendant<FirebaseAuthentication>(
            builder: (BuildContext context, Widget child,
                FirebaseAuthentication firebaseAuthentication) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          AppTheme.primaryGreenColor,
                          AppTheme.secondaryGreenColor,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(42.0),
                            child: Image.asset(
                              "assets/images/img.jpg",
                              height: 83,
                              width: 83,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          NormalText(
                            firebaseAuthentication.currentUser.displayName ==
                                    null
                                ? firebaseAuthentication.currentUser.phoneNumber
                                    .toString()
                                : firebaseAuthentication
                                    .currentUser.displayName,
                            size: AppTheme.fontSizeL,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          NormalText(
                            "ID : ${firebaseAuthentication.currentUser.uid}",
                            size: AppTheme.fontSizeL,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      firebaseAuthentication.signOut();

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Login.myRoute, (Route<dynamic> route) => false);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            size: AppTheme.iconSizeL,
                            color: AppTheme.secondaryGreyColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          NormalText(
                            "Log Out",
                            color: AppTheme.secondaryGreyColor,
                            size: AppTheme.fontSizeL,
                            boldText: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
