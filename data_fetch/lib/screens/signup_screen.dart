import 'package:flutter/material.dart';

import '../models/global_colors.dart';
import '../widgets/custom_social_login.dart';
import '../widgets/custom_textform.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // String? errorMessage = '';
  // bool isLogin = true;

  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (error) {
  //     setState(() {
  //       errorMessage = error.message;
  //     });
  //   }
  // }

  // Future<void> createUserWithEmailAndPassword() async {
  //   try {
  //     await Auth().createUserWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (error) {
  //     setState(() {
  //       errorMessage = error.message;
  //     });
  //   }
  // }

  // Widget _errorMessage() {
  //   return Text(errorMessage == '' ? '' : '$errorMessage');
  // }

  // Widget _submit() {
  //   return ElevatedButton(
  //     onPressed:
  //         isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
  //     child: Text(isLogin ? 'sign in' : 'sign up'),
  //   );
  // }

  // Widget _loginOrRegisterButton() {
  //   return TextButton(
  //     onPressed: () {
  //       setState(() {
  //         isLogin = !isLogin;
  //       });
  //     },
  //     child: Text(isLogin ? 'Register instead' : 'Login Instead'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    'LOGO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Create your Account',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: GlobalColors.textColor),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    text: 'email',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    text: 'Password',
                    obscure: true,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 4,
                          backgroundColor: GlobalColors.mainColor,
                        ),
                        child: const Text(
                          'login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: GlobalColors.mainColor,
                          elevation: 4,
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  CustomSocialLoginButton(text: '- Or sign up with -'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
