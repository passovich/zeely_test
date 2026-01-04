import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:zeely_test/constants/app_images.dart';
import 'package:zeely_test/theme/app_text_style.dart';
import 'package:zeely_test/ui/common_widgets/app_button.dart';

class NoAvatarsFound extends StatelessWidget {
  const NoAvatarsFound({
    Key? key,
    required this.onClear,
  }) : super(key: key);

  final Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.EMPTY_CUP, height: 165),
          SizedBox(
            width: 252,
            child: Text(
              FlutterI18n.translate(
                  context, 'avatars_screen.nothing_was_found'),
              style: AppTextStyle.HEADER_1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          SizedBox(height: 24),
          AppButton(
            label: FlutterI18n.translate(context, 'buttons.clear_filters'),
            isDark: false,
            onTap: onClear,
            minWidth: true,
          ),
          SizedBox(height: 12, width: double.infinity),
        ],
      ),
    );
  }
}
