import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/forgot_password_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/sign_up_prompt.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/social_login_button.dart';
import 'package:new_easy_guitalele_app/src/features/screen/desicion_screen.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class LogInScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const LogInScreen(this.myRepository, {super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // Asynchrone Login-Funktion
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return; // Formular ist ungültig, daher abbrechen
    }
    final email = _emailController.text;
    final password = _passwordController.text;

    // Optional: Ladeindikator anzeigen
    showDialog(
      context: context,
      barrierDismissible: false, // Benutzer kann Dialog nicht wegklicken
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      bool success = await widget.myRepository.loginUser(email, password);
      if (mounted) {
        Navigator.of(context).pop();
        if (success) {
          if (mounted) {}
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DesicionScreen(widget.myRepository),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login fehlgeschlagen. Bitte versuche es erneut.'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ein Fehler ist aufgetreten: $e')),
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte gib dein Passwort ein.';
    }
    if (value.length < 6) {
      return 'Das Passwort muss mindestens 6 Zeichen lang sein.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Passwort brauchteinen Großbuchstaben.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Passwort braucht eine Ziffer.';
    }
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return 'Passwort braucht ein Sonderzeichen.';
    return null; // Gültig
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF505160),
      appBar: LoginAppBar(
        automaticallyImplyLeading: false,
        preferredSize: Size(MediaQuery.of(context).size.width, 96),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              spacing: 2,
              children: [
                Text(
                  "Hi, schön, dass du da bist!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    labelText: 'Email',
                    hintText: 'Email eingeben',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
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
                    child: Text("Passwort vergessen?"),
                  ),
                ),

                CustomFilledButton(
                  text: "Login",
                  backgroundColor: AppColors.button,
                  onPressed: _login,
                ),

                Row(
                  spacing: 8,
                  children: [
                    Expanded(child: Divider()),
                    Text("oder"),
                    Expanded(child: Divider()),
                  ],
                ),

                SocialLoginButton(
                  text: "Login mit Apple",
                  backgroundColor: Colors.black,
                  icon: Icons.apple,
                  textColor: Colors.white,
                  myRepository: widget.myRepository,
                ),
                SocialLoginButton(
                  text: "Login mit Facebook",
                  backgroundColor: Colors.blue,
                  icon: Icons.facebook,
                  textColor: Colors.white,
                  myRepository: widget.myRepository,
                ),
                SocialLoginButton(
                  text: "Login mit Google",
                  backgroundColor: Colors.white,
                  icon: Icons.g_mobiledata_rounded,
                  textColor: Colors.black,
                  myRepository: widget.myRepository,
                ),

                Spacer(),
                SignUpPrompt(myRepository: widget.myRepository),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
