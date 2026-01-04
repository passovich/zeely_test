import 'package:flutter/material.dart';
import 'package:zeely_test/ui/navigation/screens.dart';
import 'package:zeely_test/ui/screens/avatars_screen/avatars_screen.dart';

///Function used for navigation and returns routes by names,
final Map<String, Widget Function(BuildContext)> appRoutes = {
  Screens.avatars: (ctx) => AvatarsScreen(),
};
