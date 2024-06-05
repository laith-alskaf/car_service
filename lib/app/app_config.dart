import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AppConfig {
  static String defaultLanguage = Locale(ui.window.locale.languageCode).languageCode;
}
