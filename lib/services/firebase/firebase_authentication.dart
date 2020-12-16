import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';

class FirebaseAuthentication extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User currentUser;

  Future<void> signInWithGoogle({@required Function loginResult}) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await googleSignIn.signOut();

      signInWithCredential(credential: credential, loginResult: loginResult);
    } catch (e) {
      loginResult(false);
    }
    loginResult(false);
  }

  Future<void> signInWithPhone(
      {@required String phone,
      @required Function loginResult,
      @required Function enterSmsCode}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) =>
            signInWithCredential(
                credential: credential, loginResult: loginResult),
        verificationFailed: (FirebaseAuthException exception) {
          loginResult(false);
        },
        codeSent: (String verificationId, _) {
          enterSmsCode(
              {verifyPhone: verifyPhone, verificationId: verificationId});
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyPhone(
      {@required String verificationId,
      @required String enteredOtp,
      @required Function loginResult}) {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: enteredOtp);

    signInWithCredential(credential: credential, loginResult: loginResult);
  }

  Future<void> signInWithCredential(
      {@required AuthCredential credential,
      @required Function loginResult}) async {
    UserCredential result = await _auth.signInWithCredential(credential);
    currentUser = result.user;
    loginResult(true);
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
