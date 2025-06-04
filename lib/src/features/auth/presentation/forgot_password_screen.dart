import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gib deine E-Mail-Adresse ein, um dein Passwort zurückzusetzen:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.button,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: 'Email',
                  hintText: 'E-Mail-Adresse eingeben',
                  filled: true,
                  labelStyle: TextStyle(color: AppColors.text),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: 'Email wiederholen',
                  hintText: 'E-Mail-Adresse wiederholen',
                  filled: true,
                  fillColor: AppColors.button,
                  labelStyle: TextStyle(color: AppColors.text),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.chordList,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Passwort-Zurücksetzung angefordert! Bitte überprüfe deine E-Mail.',
                      ),
                    ),
                  );
                },
                child: const Text('Passwort zurücksetzen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
