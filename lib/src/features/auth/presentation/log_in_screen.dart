import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/forgot_password_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/my_text_form_field.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/custom_filled_button.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/sign_up_prompt.dart';
import 'package:new_easy_guitalele_app/src/features/screen/desicion_screen.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class LogInScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const LogInScreen(this.myRepository, {super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscured = true;

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
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    labelText: 'Email',
                    hintText: 'Email eingeben',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
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
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DesicionScreen(widget.myRepository),
                    ),
                  );
                },
              ),

              Row(
                spacing: 8,
                children: [
                  Expanded(child: Divider()),
                  Text("oder"),
                  Expanded(child: Divider()),
                ],
              ),

              CustomFilledButton(
                text: "Login mit Apple",
                backgroundColor: Colors.black,
                icon: Icons.apple,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DesicionScreen(widget.myRepository),
                    ),
                  );
                },
              ),

              CustomFilledButton(
                text: "Login mit Facebook",
                backgroundColor: Colors.blue,
                icon: Icons.facebook,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DesicionScreen(widget.myRepository),
                    ),
                  );
                },
              ),

              CustomFilledButton(
                text: "Login mit Google",
                backgroundColor: Colors.white,
                icon: Icons.g_mobiledata_rounded,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DesicionScreen(widget.myRepository),
                    ),
                  );
                },
              ),

              Spacer(),
              SignUpPrompt(myRepository: widget.myRepository),
            ],
          ),
        ),
      ),
    );
  }
}
