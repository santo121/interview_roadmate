import 'package:flutter/material.dart';
import 'package:roadmate_products/modules/bottom_nav/view/bottom_nav.view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => const BottomNavScreen(),
};