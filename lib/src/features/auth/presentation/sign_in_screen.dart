import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/log_in_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/social_login_button.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class SignInScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const SignInScreen(this.myRepository, {super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatEmailController = TextEditingController();

  bool _isObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatEmailController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final email = _emailController.text;
    final password = _passwordController.text;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      bool success = await widget.myRepository.registerUser(email, password);

      if (mounted) {
        Navigator.of(context).pop();
      }

      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrierung erfolgreich! Bitte logge dich ein.'),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(widget.myRepository),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Registrierung fehlgeschlagen. E-Mail könnte bereits registriert sein.',
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fehler bei der Registrierung: $e')),
        );
      }
    }
  }

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
    if (value != _emailController.text.trim()) {
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
    if (value == _emailController.text) {
      return 'Passwort darf nicht identisch mit der E-Mail sein.';
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
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF505160),
      appBar: LoginAppBar(
        automaticallyImplyLeading: true,
        preferredSize: Size(MediaQuery.of(context).size.width, 96),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              spacing: 8,
              children: [
                Text(
                  "Bitte registriere dich",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                MyTextFormField(
                  labelText: 'Email',
                  hintText: 'Email eingeben',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                MyTextFormField(
                  labelText: 'Email wiederholen',
                  hintText: 'Email Adresse wiederholen',
                  controller: _repeatEmailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateRepeatEmail,
                ),
                MyTextFormField(
                  labelText: 'Passwort',
                  hintText: 'Passwort eingeben',
                  controller: _passwordController,
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

                CustomFilledButton(text: 'Registrieren', onPressed: _register),

                Row(
                  spacing: 16,
                  children: [
                    Expanded(child: Divider()),
                    Text("oder"),
                    Expanded(child: Divider()),
                  ],
                ),
                SocialLoginButton(
                  text: "SignIn mit Apple",
                  backgroundColor: Colors.black,
                  icon: Icons.apple,
                  textColor: Colors.white,
                  myRepository: widget.myRepository,
                ),
                SocialLoginButton(
                  text: "SignIn mit Facebook",
                  backgroundColor: Colors.blue,
                  icon: Icons.facebook,
                  textColor: Colors.white,
                  myRepository: widget.myRepository,
                ),
                SocialLoginButton(
                  text: "SignIn mit Google",
                  backgroundColor: Colors.white,
                  icon: Icons.g_mobiledata_rounded,
                  textColor: Colors.black,
                  myRepository: widget.myRepository,
                ),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Durch die Registrierung akzeptierst du unsere Nutzungsbedingungen und Datenschutzbestimmungen.",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
