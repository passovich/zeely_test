import 'package:get/get.dart';
import 'package:zeely_test/constants/age_ranges.dart';
import 'package:zeely_test/constants/genders.dart';
import 'package:zeely_test/constants/poses.dart';
import 'package:zeely_test/models/avatar_model.dart';
import 'package:zeely_test/utils_test/avatar_utils.dart';

class AvatarsController extends GetxController {
  RxBool inProgress = false.obs;
  List<AvatarModel> avatars = <AvatarModel>[].obs;
  RxList<AvatarModel> avatarsFiltered = <AvatarModel>[].obs;

  List<String> _genderFilter = [];
  List<AgeRangeModel> _ageFilter = [];
  List<String> _poseFilter = [];

  @override
  void onInit() {
    getAvatars([], [], []);
    super.onInit();
  }

  void getAvatars(List<int> genders, List<int> ages, List<int> poses) {
    ///Here should be request to API using one of services
    inProgress.value = true;

    avatars = AvatarUtils().generateAvatars(30);
    avatarsFiltered.addAll(avatars);
    inProgress.value = false;
  }

  void filterAvatars(
    List<int> genderIndexes,
    List<int> ageIndexes,
    List<int> poseIndexes,
  ) {
    avatarsFiltered.clear();

    ///Check models only if at least one of filters exist
    ///or add all models to result
    if (genderIndexes.isNotEmpty ||
        ageIndexes.isNotEmpty ||
        poseIndexes.isNotEmpty) {
      _resetFilters(genderIndexes, ageIndexes, poseIndexes);

      for (final avatar in avatars) {
        if ((_genderFilter.isEmpty || _genderFilter.contains(avatar.gender)) &&
            (_poseFilter.isEmpty || _poseFilter.contains(avatar.pose))) {
          if (_ageFilter.isEmpty) {
            avatarsFiltered.add(avatar);
          } else {
            for (final age in _ageFilter) {
              if (avatar.age! >= age.minAge && avatar.age! <= age.maxAge) {
                avatarsFiltered.add(avatar);
                break;
              }
            }
          }
        }
      }
    } else {
      avatarsFiltered.addAll(avatars);
    }
  }

  _resetFilters(
    List<int> genderIndexes,
    List<int> ageIndexes,
    List<int> poseIndexes,
  ) {
    _genderFilter.clear();
    _ageFilter.clear();
    _poseFilter.clear();
    for (final index in genderIndexes) {
      _genderFilter.add(GENDERS[index]);
    }
    for (final index in ageIndexes) {
      _ageFilter.add(AGE_RANGES[index]);
    }
    for (final index in poseIndexes) {
      _poseFilter.add(POSES[index]);
    }
  }
}
