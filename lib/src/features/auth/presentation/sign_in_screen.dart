import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/log_in_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/or_divider.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/registration_form.dart';
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
          child: Column(
            spacing: 4,
            children: [
              Text(
                "Bitte registriere dich",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),

              RegistrationForm(
                formKey: _formKey,
                emailController: _emailController,
                repeatEmailController: _repeatEmailController,
                passwordController: _passwordController,
                onRegisterPressed: _register,
              ),

              const OrDivider(),

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

              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Durch die Registrierung akzeptierst du unsere Nutzungsbedingungen und Datenschutzbestimmungen.",
                  textAlign: TextAlign.center,
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
    );
  }
}
