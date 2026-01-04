import 'package:flutter/material.dart';
import 'package:zeely_test/theme/app_colors.dart';

class AppPopup extends StatelessWidget {
  const AppPopup({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        margin: EdgeInsets.only(left: 16,right: 16,bottom: 34),
        decoration: BoxDecoration(
            color: AppColors.WHITE,
            borderRadius: BorderRadius.all(Radius.circular(28))),
        child: Material(
          child: ColoredBox(
            color: AppColors.WHITE,
            child: child,
          ),
        ),
      ),
    );
  }
}
