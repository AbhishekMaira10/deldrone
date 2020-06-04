import 'package:deldrone_customer/custom_widgets/animation/FadeAnimation.dart';

import 'package:deldrone_customer/ui/sign_in/social_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:deldrone_customer/ui/sign_in/validators.dart';

class LoginPage extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _toggleVisibility = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  bool _submitted = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Opacity(
                    opacity: 0.5, child: Image.asset('assets/images/bg.png')),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
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
                      height: 20,
                    ),
                    FadeAnimation(
                      1.1,
                      Padding(
                        padding: const EdgeInsets.all(16.0),
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
                    FadeAnimation(
                        1.2,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: EdgeInsets.only(top: 2, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {},
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
                      height: 20,
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
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
    ];
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          hintText: 'test@test.com',
          errorText: showErrorText ? widget.invalidEmailErrorText : null,
          enabled: _isLoading == false),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
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
          errorText: showErrorText ? widget.invalidPasswordErrorText : null,
          enabled: _isLoading == false),
      obscureText: _toggleVisibility,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: () {},
    );
  }

  void _updateState() {
    setState(() {});
  }
}
