import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationThemeData(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primary,
        surfaceTint: Colors.transparent,
      ),
    );
