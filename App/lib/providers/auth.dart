import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deldrone_customer/custom_widgets/alerts/platform_exception_alert_dialog.dart';
import 'package:deldrone_customer/models/users.dart';
import 'package:deldrone_customer/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }

  Future<bool> signIn(BuildContext context) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      PlatformExceptionAlertDialog(
        title: 'Registration Failed',
        exception: e,
      ).show(context);
      return false;
    }
  }

  Future<bool> signUp(BuildContext context) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').document(result.user.uid).setData(
            {'name': name.text, 'email': email.text, 'uid': result.user.uid});
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: e,
      ).show(context);
      return false;
    }
  }

  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      notifyListeners();
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final authResult = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          _firestore.collection('users').document(authResult.user.uid).setData({
            'name': authResult.user.displayName,
            'email': authResult.user.email,
            'uid': authResult.user.uid
          });
          return authResult.user != null;
        }
      }
      return false;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: e,
      ).show(context);
      return false;
    }
  }

  Future signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }
}
