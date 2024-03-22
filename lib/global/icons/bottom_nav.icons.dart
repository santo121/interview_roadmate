import 'package:flutter/widgets.dart';

class SuperHeroIcons {
  SuperHeroIcons._();

  static const _kFontFam = 'bottom_nav';
  static const _service = 'service';
  static const String? _kFontPkg = null;

  static const IconData home =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData service =
      IconData(0xe801, fontFamily: _service, fontPackage: _service);
}