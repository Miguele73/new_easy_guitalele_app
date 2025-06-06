import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/forgot_password_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ForgotPasswordScreen(this.myRepository, {super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _repeatEmailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _repeatEmailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword(String email) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await Future.delayed(const Duration(seconds: 2));

      bool success = await widget.myRepository.resetPassword(email);

      if (mounted) {
        Navigator.of(context).pop();
      }

      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Passwort-Zurücksetzung angefordert! Bitte überprüfe deine E-Mail.',
              ),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ein unerwarteter Fehler ist aufgetreten: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ForgotPasswordForm(
            formKey: _formKey,
            emailController: _emailController,
            repeatEmailController: _repeatEmailController,
            onSubmit: _resetPassword,
          ),
        ),
      ),
    );
  }
}
