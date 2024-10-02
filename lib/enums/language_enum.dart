import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_multi_language/gen/assets.gen.dart';

enum Language {
  english(
    Locale('en'),
    Assets.english,
    "English",
  ),
  hindi(
    Locale('hi'),
    Assets.dutch,
    "Hindi",
  );

  final Locale locale;
  final AssetGenImage image;
  final String text;

  const Language(this.locale, this.image, this.text);
}
