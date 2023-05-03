import 'package:data_fetch/models/global_colors.dart';
import 'package:data_fetch/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class CustomSignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: Text('Signup', style: TextStyle(
              color: GlobalColors.mainColor,
              fontWeight: FontWeight.w400,
            ),),
          )
        ],
      ),
    );
  }
}
