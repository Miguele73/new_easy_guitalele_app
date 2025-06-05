import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/features/screen/desicion_screen.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final IconData icon;
  final Color textColor;
  final DatabaseRepository myRepository;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon,
    required this.textColor,
    required this.myRepository,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      text: text,
      backgroundColor: backgroundColor,
      icon: icon,
      textColor: textColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DesicionScreen(myRepository)),
        );
      },
    );
  }
}
