import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class RegistrationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController repeatEmailController;
  final TextEditingController passwordController;
  final Future<void> Function()
  onRegisterPressed; // Callback für den Registrierungs-Button

  const RegistrationForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.repeatEmailController,
    required this.passwordController,
    required this.onRegisterPressed,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscured = true;

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

  String? _validateRepeatEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte wiederhole deine E-Mail-Adresse.';
    }

    if (value.trim() != widget.emailController.text.trim()) {
      return 'E-Mail-Adressen stimmen nicht überein.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte gib ein Passwort ein.';
    }
    if (value.length < 6) {
      return 'Das Passwort muss mindestens 6 Zeichen lang sein.';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Passwort benötigt mind. einen Kleinbuchstaben.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Passwort benötigt mind. einen Großbuchstaben.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Passwort benötigt mind. eine Ziffer.';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Passwort benötigt mind. ein Sonderzeichen.';
    }

    if (value == widget.emailController.text) {
      return 'Passwort darf nicht identisch mit der E-Mail sein.';
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
          MyTextFormField(
            labelText: 'Email',
            hintText: 'Email eingeben',
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          MyTextFormField(
            labelText: 'Email wiederholen',
            hintText: 'Email Adresse wiederholen',
            controller: widget.repeatEmailController,
            keyboardType: TextInputType.emailAddress,
            validator: _validateRepeatEmail,
          ),
          MyTextFormField(
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
          CustomFilledButton(
            text: 'Registrieren',
            onPressed: widget.onRegisterPressed,
          ),
        ],
      ),
    );
  }
}
