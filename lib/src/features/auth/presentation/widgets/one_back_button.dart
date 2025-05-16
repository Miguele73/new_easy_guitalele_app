import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class OneBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? iconSize;
  final EdgeInsets? padding;

  const OneBackButton({super.key, this.onPressed, this.iconSize, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        mini: true,
        onPressed:
            onPressed ??
            () {
              Navigator.of(context).maybePop();
            },
        backgroundColor: AppColors.backgroundOp,
        child: Image.asset('assets/icons/BackIcon.png', color: AppColors.white),
      ),
    );
  }
}
