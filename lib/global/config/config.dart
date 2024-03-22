import 'package:easy_reo_fonts/easy_reo_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/global/config/dependency_injection.config.dart';
import 'package:roadmate_products/main.dart';

class Config {
  //*--- Base url
  final String baseUrl = 'https://roadmate.in/mechine_test/public/api';
  //*--- google map key
  static const String dbName = 'roadMate';
  String tokenKey = 'authToken';
  String 
  appName = 'Road Mate';
 //*--- money decimals 
 int moneyDecimals = 2; 
}

//*---------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;

//*---------- (Media_Query)
Size size = MediaQuery.sizeOf(globalContext);


//*---------- (Title Font Family object)
KStyles kStyles = getIt<KStyles>(instanceName: 'font');
//*---------- (model Interceptor)


final dataInterceptor =
    Provider.of<DataInterceptor>(globalContext, listen: false);
