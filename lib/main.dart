import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/provider.config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';

import 'global/config/dependency_injection.config.dart';
import 'global/config/routes.widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Future.delayed(const Duration(milliseconds: 300));
  setupGetIt();
  runApp(MultiProvider(
      providers: providers,child: const MyApp()));
}
GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      
      builder: (context,_) {
        return Platform.isIOS
                    ? CupertinoApp(
                      color: kBg,
                        title:Config().appName,
                        routes: routes,
                        initialRoute: '/',
                        navigatorKey: navigationKey,
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: const [
                          DefaultWidgetsLocalizations.delegate,
                          DefaultMaterialLocalizations.delegate,
                          DefaultCupertinoLocalizations.delegate,
                        ],
                      )
                    : MaterialApp(
                      color: kBg,

                        routes: routes,
                        title: Config().appName,
                        initialRoute: '/',
                        navigatorKey: navigationKey,
                        debugShowCheckedModeBanner: false,
                        theme: ThemeData(
                          colorScheme:
                              ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                          useMaterial3: true,
                        ),
                      );
      },
          designSize: const Size(430, 932),
    );
    

  }
}
