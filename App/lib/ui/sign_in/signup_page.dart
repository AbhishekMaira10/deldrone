import 'package:deldrone_customer/custom_widgets/alerts/loading_indicator.dart';
import 'package:deldrone_customer/custom_widgets/alerts/platform_exception_alert_dialog.dart';
import 'package:deldrone_customer/custom_widgets/animation/FadeAnimation.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/services/auth.dart';
import 'package:deldrone_customer/ui/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:deldrone_customer/ui/sign_in/validators.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _toggleVisibility = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  bool _submitted = false;
  bool _isLoading2 = false;

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

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading2 = true;
    });
    try {
      showLoadingIndicator(context, "Signing Up....");
      final auth = Provider.of<AuthBase>(context);
      await auth.createUserWithEmailAndPassword(_email, _password);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: e,
      ).show(context);
    } finally {
      setState(() {
        _isLoading2 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
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
                      height: 50,
                    ),
                    FadeAnimation(
                        1,
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1,
                        Text(
                          "Create an account, It's free",
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
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: _submit,
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.3,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an account?",
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
                              onTap: () {
                                Navigator.of(context).pop();
                                _emailController.clear();
                                _passwordController.clear();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
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
          enabled: _isLoading2 == false),
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
          enabled: _isLoading2 == false),
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
