import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_form.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/or_divider.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
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
      bool success = await widget.myRepository.loginUser(email, password);

      if (mounted) {
        Navigator.of(context).pop();
        if (success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DesicionScreen(widget.myRepository),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login fehlgeschlagen. Ungültige Anmeldedaten.'),
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

              LoginForm(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                onLoginPressed: _login,
                myRepository: widget.myRepository,
              ),

              const OrDivider(),

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
              const Spacer(),
              SignUpPrompt(myRepository: widget.myRepository),
            ],
          ),
        ),
      ),
    );
  }
}
