import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class ForgotPasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController repeatEmailController;
  final Future<void> Function(String email) onSubmit;

  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.repeatEmailController,
    required this.onSubmit,
  });

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const Text(
            'Gib deine E-Mail-Adresse ein, um dein Passwort zurückzusetzen:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.text),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MyTextFormField(
              labelText: 'Email',
              hintText: 'E-Mail-Adresse eingeben',
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MyTextFormField(
              labelText: 'Email wiederholen',
              hintText: 'E-Mail-Adresse wiederholen',
              controller: widget.repeatEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: _validateRepeatEmail,
            ),
          ),
          const SizedBox(height: 40),
          CustomFilledButton(
            text: 'Passwort zurücksetzen',
            backgroundColor: AppColors.button,
            onPressed: () => widget.onSubmit(widget.emailController.text),
          ),
        ],
      ),
    );
  }
}
