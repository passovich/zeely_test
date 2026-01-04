import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:zeely_test/constants/genders.dart';
import 'package:zeely_test/models/avatar_model.dart';
import 'package:zeely_test/theme/app_colors.dart';
import 'package:zeely_test/theme/app_text_style.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final AvatarModel avatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(avatar.image!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.BLACK.withValues(alpha: 0.05)),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.BLACK.withValues(alpha: 0.0),
                AppColors.BLACK.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                avatar.name ?? '',
                style: AppTextStyle.MEDIUM.copyWith(color: AppColors.WHITE),
              ),
              Row(
                children: [
                  Text(
                    FlutterI18n.translate(
                      context,'gender.${MAP_GENDERS[avatar.gender]}'),
                    style: AppTextStyle.EXTRA_SMALL
                        .copyWith(color: AppColors.WHITE),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.WHITE,
                    ),
                  ),
                  Text(
                    '${avatar.age}',
                    style: AppTextStyle.EXTRA_SMALL
                        .copyWith(color: AppColors.WHITE),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
