import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool automaticallyImplyLeading;
  const LoginAppBar({
    super.key,
    required this.preferredSize,
    required this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      centerTitle: true,
      toolbarHeight: 96,
      backgroundColor: AppColors.appBar,

      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logo/logo_klein.png', width: 50, height: 50),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 2, 4, 16),
            child: Text(
              "Easy Guitalele",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
