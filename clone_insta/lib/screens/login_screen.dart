import 'package:clone_insta/resources/auth_method.dart';
import 'package:clone_insta/utils/colors.dart';
import 'package:clone_insta/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      ///
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 5,
          ),
          SvgPicture.asset(
            'assets/images/ic_instagram.svg',
            color: primaryColor,
            height: 64,
          ),
          SizedBox(
            height: 24,
          ),
          TextFieldInput(_emailController, 'Enter your email', false,
              TextInputType.emailAddress),
          SizedBox(
            child: Container(),
            height: 24,
          ),
          TextFieldInput(_passwordController, 'Enter your password', true,
              TextInputType.text),
          SizedBox(
            height: 24,
          ),
          InkWell(
            child: Container(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text('Log in'),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor),
            ),
            onTap: loginUser,
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Don't have an account?"),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                child: Container(
                  child: Text(
                    "Sign up.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    )));
  }
}
