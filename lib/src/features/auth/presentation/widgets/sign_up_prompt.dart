import 'package:flutter/material.dart';

import 'package:new_easy_guitalele_app/src/features/auth/presentation/sign_in_screen.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class SignUpPrompt extends StatelessWidget {
  final DatabaseRepository myRepository;
  const SignUpPrompt({super.key, required this.myRepository});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          "Du hast noch keinen Account?",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.scales,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(myRepository),
              ),
            );
          },
          child: Text(
            "Registrieren",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.text,
            ),
          ),
        ),
      ],
    );
  }
}
