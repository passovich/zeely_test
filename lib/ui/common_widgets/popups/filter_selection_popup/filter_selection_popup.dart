import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:zeely_test/theme/app_colors.dart';
import 'package:zeely_test/theme/app_text_style.dart';
import 'package:zeely_test/ui/common_widgets/app_button.dart';
import 'package:zeely_test/ui/common_widgets/popups/app_popup/app_popup.dart';

class FilterSelectionPopup<T> extends StatefulWidget {
  const FilterSelectionPopup({
    Key? key,
    required this.title,
    required this.elements,
    required this.preselectedFilters,
    required this.buildElement,
    required this.onSubmit,
  }) : super(key: key);

  final String title;
  final List<T> elements;
  final List<int> preselectedFilters;
  final Function(T) buildElement;
  final Function(List<int>) onSubmit;

  @override
  State<FilterSelectionPopup<T>> createState() =>
      _FilterSelectionPopupState<T>();
}

class _FilterSelectionPopupState<T> extends State<FilterSelectionPopup<T>> {
  List<bool> selections = [];

  @override
  void initState() {
    setFilters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppPopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: AppTextStyle.HEADER),
              SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () => Get.back(),
                  icon: Icon(
                    CupertinoIcons.clear,
                    size: 24,
                    color: AppColors.BLACK,
                  ),
                ),
              ),
            ],
          ),
          ...buildSelectionList(),
          SizedBox(height: 32),
          AppButton(
            label: FlutterI18n.translate(context, 'buttons.save'),
            onTap: submit,
          ),
        ],
      ),
    );
  }

  List<Widget> buildSelectionList() {
    List<Widget> result = [];
    for (int i = 0; i < widget.elements.length; i++) {
      result.add(
        GestureDetector(
          onTap: () => setState(() => selections[i] = !selections[i]),
          child: Container(
            padding: EdgeInsets.only(top: 25.5),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.buildElement(widget.elements[i]),
                if (selections[i] != true)
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.GREY_MID),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  )
                else
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: AppColors.BLACK,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(
                      CupertinoIcons.checkmark,
                      color: AppColors.WHITE,
                      size: 12,
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    }
    return result;
  }

  void setFilters() {
    if (widget.preselectedFilters.isEmpty) {
      widget.elements.forEach((el) => selections.add(false));
    } else {
      for (int i = 0; i < widget.elements.length; i++) {
        selections.add(widget.preselectedFilters.contains(i));
      }
    }
  }

  void submit() {
    final result = <int>[];
    for (int i = 0; i < selections.length; i++) {
      if (selections[i]) {
        result.add(i);
      }
    }
    widget.onSubmit(result);
    Get.back();
  }
}
