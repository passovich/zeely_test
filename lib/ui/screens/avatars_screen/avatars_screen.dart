import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:zeely_test/constants/age_ranges.dart';
import 'package:zeely_test/constants/genders.dart';
import 'package:zeely_test/constants/poses.dart';
import 'package:zeely_test/controllers/avatars_controller.dart';
import 'package:zeely_test/theme/app_colors.dart';
import 'package:zeely_test/theme/app_text_style.dart';
import 'package:zeely_test/ui/common_widgets/popups/filter_selection_popup/filter_selection_popup.dart';
import 'package:zeely_test/ui/screens/avatars_screen/widgets/awatars_list.dart';
import 'package:zeely_test/ui/screens/avatars_screen/widgets/filter_button.dart';
import 'package:zeely_test/ui/screens/avatars_screen/widgets/no_avatars_found.dart';

class AvatarsScreen extends StatefulWidget {
  AvatarsScreen({Key? key}) : super(key: key);

  @override
  State<AvatarsScreen> createState() => _AvatarsScreenState();
}

class _AvatarsScreenState extends State<AvatarsScreen> {
  final controller = Get.put(AvatarsController());
  List<int> genderIndexes = [];
  List<int> ageIndexes = [];
  List<int> poseIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      backgroundColor: AppColors.WHITE,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  FlutterI18n.translate(
                    context,
                    'avatars_screen.all_avatars',
                  ),
                  style: AppTextStyle.HEADER,
                ),
              ),
              Wrap(
                runSpacing: 12,
                children: [
                  if (genderIndexes.isNotEmpty ||
                      ageIndexes.isNotEmpty ||
                      poseIndexes.isNotEmpty)
                    Container(
                      height: 36,
                      width: 36,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.GREY_LIGHT),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: IconButton(
                        onPressed: clearFilters,
                        icon: Icon(
                          Icons.clear,
                          size: 18,
                          color: AppColors.BLACK,
                        ),
                      ),
                    ),
                  FilterButton(
                    label: FlutterI18n.translate(
                      context,
                      'avatars_screen.gender',
                    ),
                    selectedCount: genderIndexes.length,
                    onTap: () {
                      Get.dialog(
                        FilterSelectionPopup<String>(
                          title: FlutterI18n.translate(
                            context,
                            'avatars_screen.gender',
                          ),
                          elements: GENDERS,
                          preselectedFilters: genderIndexes,
                          buildElement: (e) =>
                              Text(FlutterI18n.translate(context, 'gender.$e')),
                          onSubmit: (sel) {
                            genderIndexes = sel;
                            controller.filterAvatars(
                              genderIndexes,
                              ageIndexes,
                              poseIndexes,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  FilterButton(
                    label: FlutterI18n.translate(context, 'avatars_screen.age'),
                    selectedCount: ageIndexes.length,
                    onTap: () {
                      Get.dialog(
                        FilterSelectionPopup<AgeRangeModel>(
                          title: FlutterI18n.translate(
                            context,
                            'avatars_screen.age',
                          ),
                          elements: AGE_RANGES,
                          preselectedFilters: ageIndexes,
                          buildElement: (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(FlutterI18n.translate(
                                  context, 'age.${e.titleLocaleKey}')),
                              Text(e.stringAge),
                            ],
                          ),
                          onSubmit: (sel) {
                            ageIndexes = sel;
                            controller.filterAvatars(
                                genderIndexes, ageIndexes, poseIndexes);
                          },
                        ),
                      );
                    },
                  ),
                  FilterButton(
                    label:
                        FlutterI18n.translate(context, 'avatars_screen.pose'),
                    selectedCount: poseIndexes.length,
                    onTap: () {
                      Get.dialog(
                        FilterSelectionPopup<String>(
                          title: FlutterI18n.translate(
                              context, 'avatars_screen.pose'),
                          elements: POSES,
                          preselectedFilters: poseIndexes,
                          buildElement: (e) =>
                              Text(FlutterI18n.translate(context, 'pose.$e')),
                          onSubmit: (sel) {
                            poseIndexes = sel;
                            controller.filterAvatars(
                                genderIndexes, ageIndexes, poseIndexes);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              if (controller.inProgress.isTrue)
                Expanded(child: Center(child: CircularProgressIndicator()))
              else if (controller.avatarsFiltered.isNotEmpty)
                AvatarsList()
              else
                NoAvatarsFound(onClear: clearFilters),
            ],
          ),
        ),
      ),
    );
  }

  void clearFilters() {
    genderIndexes.clear();
    ageIndexes.clear();
    poseIndexes.clear();
    controller.filterAvatars(genderIndexes, ageIndexes, poseIndexes);
  }
}
