import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeely_test/controllers/avatars_controller.dart';
import 'package:zeely_test/ui/screens/avatars_screen/widgets/avatar_card.dart';

class AvatarsList extends StatelessWidget {
  const AvatarsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AvatarsController controller = Get.find();
    return Obx(
      () => Expanded(
        child: GridView.count(
          childAspectRatio: 0.737,
          padding: EdgeInsets.symmetric(vertical: 12),
          mainAxisSpacing: 16,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: controller.avatarsFiltered
              .map((e) => GridTile(child: AvatarCard(avatar: e)))
              .toList(),
        ),
      ),
    );
  }
}
