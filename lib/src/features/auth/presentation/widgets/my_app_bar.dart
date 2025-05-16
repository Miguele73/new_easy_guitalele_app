import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/one_back_button.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required bool automaticallyImplyLeading});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(96);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: OneBackButton(
        padding: const EdgeInsets.fromLTRB(16, 4, 0, 54),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      automaticallyImplyLeading: true,

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
