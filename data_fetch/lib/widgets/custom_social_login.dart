import 'package:data_fetch/models/global_colors.dart';
import 'package:flutter/material.dart';

class CustomSocialLoginButton extends StatelessWidget {
  final String text;
  CustomSocialLoginButton({required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, color: Colors.black.withOpacity(0.2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/google.png',
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                width: 12,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, color: Colors.black.withOpacity(0.2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/facebook_icon.png',
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                width: 12,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, color: Colors.black.withOpacity(0.2))
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/twitter_icon.png',
                      fit: BoxFit.cover,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
