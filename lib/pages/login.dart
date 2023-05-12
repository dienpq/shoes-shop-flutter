import 'package:app_shoes__shop/pages/control_page.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:flutter/material.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/common.dart';
import 'package:app_shoes__shop/ultilities/raised_gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: ColorUtils.appBarGradient),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 32),
                    ),
                  )),
              const Positioned(
                top: 150,
                left: 10,
                right: 10,
                child: LoginFormWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginFormWidgetState();
  }
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController(text: "dienpq1604@gmail.com");
  final _userPasswordController = TextEditingController(text: "16042001");
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _buildIntroText(),
                _buildEmailField(context),
                _buildPasswordField(context),
                _buildForgotPasswordWidget(context),
                _buildSignUpButton(context),
                _buildLoginOptionText(),
                _buildSocialLoginRow(context),
              ],
            ),
          ),
          _buildSignUp(),
        ],
      ),
    );
  }

  Widget _buildSocialLoginRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          __buildFacebookButtonWidget(context),
          __buildTwitterButtonWidget(context)
        ],
      ),
    );
  }

  Widget __buildTwitterButtonWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(29, 161, 242, 1.0),
            fixedSize: const Size.fromHeight(35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            // Add your button logic here
          },
          child: Image.asset(
            "assets/images/ic_twitter.png",
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }

  Widget __buildFacebookButtonWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(42, 82, 151, 1.0),
            fixedSize: const Size.fromHeight(35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            // Add your button logic here
          },
          child: Image.asset(
            "assets/images/ic_fb.png",
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginOptionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Or sign up with social account",
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildIntroText() {
    return const Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 30),
          child: Text(
            "Shoes Shop",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Image.asset(
        "assets/images/products/nike/nike_1.png",
        height: 160,
        width: 160,
      ),
    );
  }

  String _userNameValidation(String value) {
    if (value.isEmpty) {
      return "Please enter valid user name";
    } else {
      return "";
    }
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _emailValidation(value!),
        decoration: CommonStyles.textFormFieldStyle("Email", ""),
      ),
    );
  }

  String _emailValidation(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Enter valid email address";
    } else {
      return "";
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value!),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "",
          labelStyle: const TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot your password ?',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        child: RaisedGradientButton(
          onPressed: () {
            _signUpProcess(context);
          },
          key: const ValueKey('button-login'),
          child: const Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Future<void> _signUpProcess(BuildContext context) async {
    final login = await checkLogin(_userEmailController.text, _userPasswordController.text);
    if (login) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ControlPage(),
        ),
      );
    }
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
              text: "Don't have an Account ? ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.orange,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
