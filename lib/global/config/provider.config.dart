import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/modules/bottom_nav/controller/bottom_nav.ctrl.dart';

import '../../modules/product_details/controller/product_details.controller.dart';

List<SingleChildWidget> providers = [
 ChangeNotifierProvider(create: (context) => BottomNavController()),
 ChangeNotifierProvider(create: (context) => DataInterceptor()),
 ChangeNotifierProvider(create: (context) => ProductDetailsController()),
];