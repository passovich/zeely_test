import 'package:flutter/material.dart';
import 'package:zeely_test/theme/app_colors.dart';

class AppTextStyle {
  static const String _ITALIAN_PLATE_FONT_FAMILY = 'Italian Plate No2 Expanded';

  static const TextStyle HEADER = TextStyle(
    color: AppColors.BLACK,
    fontSize: 26.0,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle HEADER_1 = TextStyle(
    color: AppColors.BLACK,
    fontSize: 22.0,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle HEADER_2 = TextStyle(
    color: AppColors.BLACK,
    fontSize: 16.0,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static const TextStyle MEDIUM = TextStyle(
    color: AppColors.BLACK,
    fontSize: 14,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  static const TextStyle SMALL = TextStyle(
    color: AppColors.BLACK,
    fontSize: 12,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle SMALL_BOLD = TextStyle(
    color: AppColors.BLACK,
    fontSize: 12,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 1.4,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const TextStyle EXTRA_SMALL = TextStyle(
    color: AppColors.BLACK,
    fontSize: 10,
    fontFamily: _ITALIAN_PLATE_FONT_FAMILY,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.0,
  );
}
