import 'package:flutter/cupertino.dart';
import 'package:zeely_test/theme/app_colors.dart';
import 'package:zeely_test/theme/app_text_style.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.label,
    required this.selectedCount,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final int selectedCount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.GREY_LIGHT),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTextStyle.SMALL),
            if (selectedCount > 0) filtersCount(context, selectedCount),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget filtersCount(BuildContext context, int count) {
    final size = 16.0;
    return Container(
      margin: EdgeInsets.only(left: 4, bottom: 2),
      alignment: Alignment.center,
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.BLACK,
      ),
      child: Text(
        '$count',
        style: AppTextStyle.SMALL_BOLD.copyWith(color: AppColors.WHITE),
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: false,
        ),
      ),
    );
  }
}
