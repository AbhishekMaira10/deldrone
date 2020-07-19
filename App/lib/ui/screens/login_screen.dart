import 'package:deldrone_customer/custom_widgets/alerts/platform_exception_alert_dialog.dart';
import 'package:deldrone_customer/custom_widgets/animation/FadeAnimation.dart';
import 'package:deldrone_customer/custom_widgets/background_widget.dart';
import 'package:deldrone_customer/custom_widgets/screen_navigation.dart';
import 'package:deldrone_customer/providers/user_provider.dart';
import 'package:deldrone_customer/ui/screens/main_screen.dart';
import 'package:deldrone_customer/ui/screens/registration_screen.dart';
import 'package:deldrone_customer/ui/sign_in/social_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:deldrone_customer/ui/sign_in/validators.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';

class LoginScreen extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _toggleVisibility = true;
  final _key = GlobalKey<ScaffoldState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _submitted = false;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<UserProvider>(context);
      if (!await auth.signInWithGoogle(context)) {
        _key.currentState
            .showSnackBar(SnackBar(content: Text("Login failed!")));
        return;
      }
      auth.clearController();
      changeScreenReplacement(context, MainScreen());
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _emailEditingComplete() {
    final authProvider = Provider.of<UserProvider>(context);
    final newFocus = widget.emailValidator.isValid(authProvider.email.text)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _submit() async {
    setState(() => _submitted = true);
    final authProvider = Provider.of<UserProvider>(context);
    if (!await authProvider.signIn(context)) {
      _key.currentState.showSnackBar(SnackBar(content: Text("Login failed!")));
      return;
    }
    authProvider.clearController();
    changeScreenReplacement(context, MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        key: _key,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              BackgroundWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1,
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1,
                        Text(
                          "Login to your account",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                      1.1,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: _buildChildren(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: EdgeInsets.only(top: 2, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.black)),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: _submit,
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1.3,
                      Center(
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Circular',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1.3,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SocialSignInButton(
                          assetName: 'assets/images/google-logo.png',
                          text: 'Sign in with Google',
                          textColor: Colors.black87,
                          color: Colors.grey[100],
                          onPressed: () => _signInWithGoogle(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Circular',
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () => changeScreenReplacement(
                                  context, SignupScreen()),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      _buildEmailTextField(),
      SizedBox(height: 10.0),
      _buildPasswordTextField(),
      SizedBox(height: 10.0),
    ];
  }

  TextField _buildEmailTextField() {
    final authProvider = Provider.of<UserProvider>(context);
    bool showErrorText =
        _submitted && !widget.emailValidator.isValid(authProvider.email.text);
    return TextField(
      controller: authProvider.email,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          hintText: 'test@test.com',
          icon: Icon(Icons.email),
          errorText: showErrorText ? widget.invalidEmailErrorText : null),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  TextField _buildPasswordTextField() {
    final authProvider = Provider.of<UserProvider>(context);
    bool showErrorText = _submitted &&
        !widget.passwordValidator.isValid(authProvider.password.text);
    return TextField(
      controller: authProvider.password,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          icon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: _toggleVisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                _toggleVisibility = !_toggleVisibility;
              });
            },
          ),
          errorText: showErrorText ? widget.invalidPasswordErrorText : null),
      obscureText: _toggleVisibility,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  void _updateState() {
    setState(() {});
  }
}
