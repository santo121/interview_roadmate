import 'package:easy_reo_fonts/easy_reo_fonts.dart';
import 'package:get_it/get_it.dart';
import 'package:roadmate_products/global/config/assets.config.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<KStyles>(() {
    return KStyles(fontFamily: 'Rubik', fontType: FontType.googleFonts);
  }, instanceName: 'font');
  getIt.registerLazySingleton<AssetsUrl>(() {
    return AssetsUrl();
  });
}
