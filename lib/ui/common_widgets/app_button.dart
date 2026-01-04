import 'package:flutter/material.dart';
import 'package:zeely_test/theme/app_colors.dart';
import 'package:zeely_test/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    this.buttonIsActive = true,
    required this.onTap,
    this.isDark = true,
    this.minWidth = false,
  }) : super(key: key);

  final String label;
  final bool buttonIsActive;
  final bool isDark;
  final bool minWidth;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final height = 62.0;
    return Container(
      width: minWidth ?null :double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: buttonIsActive ? onTap : () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          shadowColor: AppColors.WHITE,
          backgroundColor: isDark ? AppColors.BLACK : AppColors.WHITE,
          elevation: 0,
          side: BorderSide(width: 1, color: AppColors.GREY_LIGHT)
        ),
        child: Text(
          label,
          style: isDark
              ? AppTextStyle.HEADER_2.copyWith(color: AppColors.WHITE)
              : AppTextStyle.HEADER_2,
        ),
      ),
    );
  }
}
