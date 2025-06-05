import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/forgot_password_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Future<void> Function() onLoginPressed;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscured = true;

  // Validierungsfunktionen hierher verschieben
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte gib deine E-Mail-Adresse ein.';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Bitte gib eine gültige E-Mail-Adresse ein.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte gib dein Passwort ein.';
    }
    if (value.length < 6) {
      return 'Das Passwort muss mindestens 6 Zeichen lang sein.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Passwort benötigt mind. einen Großbuchstaben.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Passwort benötigt mind. eine Ziffer.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              labelText: 'Email',
              hintText: 'Email eingeben',
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              labelText: 'Passwort',
              hintText: 'Passwort eingeben',
              controller: widget.passwordController,
              obscureText: _isObscured,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.text,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              validator: _validatePassword,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.text,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.rye().fontFamily,
                ),
              ),
              child: const Text("Passwort vergessen?"),
            ),
          ),
          CustomFilledButton(
            text: "Login",
            backgroundColor: AppColors.button,
            onPressed: widget.onLoginPressed, // Callback aufrufen
          ),
        ],
      ),
    );
  }
}
