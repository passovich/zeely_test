import 'dart:math' as math;
import 'package:zeely_test/constants/app_images.dart';
import 'package:zeely_test/constants/poses.dart';
import 'package:zeely_test/models/avatar_model.dart';

import '../constants/genders.dart' show GENDERS;

class AvatarUtils {
  static const List<String> AVATAR_NAMES = [
    'Jenifer',
    'Samantha',
    'Tim',
    'Mary',
    'Tom',
    'Marta',
    'Monika'
    'Bob',
  ];

  static const List<String> AVATAR_PHOTOS = [
    AppImages.AVATAR_EXAMPLE_1,
    AppImages.AVATAR_EXAMPLE_2,
    AppImages.AVATAR_EXAMPLE_3,
    AppImages.AVATAR_EXAMPLE_4,
    AppImages.AVATAR_EXAMPLE_5,
    AppImages.AVATAR_EXAMPLE_6,
    AppImages.AVATAR_EXAMPLE_7,
    AppImages.AVATAR_EXAMPLE_8,
  ];

  List<String> AVATAR_GENDERS = [
    GENDERS[1],
    GENDERS[1],
    GENDERS[0],
    GENDERS[1],
    GENDERS[0],
    GENDERS[1],
    GENDERS[1],
    GENDERS[0],
  ];

  ///Used to generate mock avatar models
  List<AvatarModel> generateAvatars(int count) {
    final List<AvatarModel> result = [];
    for (int i = 0; i < 30; i++) {
      final n = math.Random().nextInt(AVATAR_NAMES.length);
      result.add(
        AvatarModel(
          name: AVATAR_NAMES[n],
          ///generate age from 18 to 100 years
          age: math.Random().nextInt(82) + 18,
          gender: AVATAR_GENDERS[n],
          pose: POSES[math.Random().nextInt(POSES.length)],
          image: AVATAR_PHOTOS[n],
        ),
      );
    }
    return result;
  }
}
