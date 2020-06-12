///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/08 23:18
///
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_common_exports/flutter_common_exports.dart';

export 'package:ff_annotation_route/ff_annotation_route.dart' show FFRoute, PageRouteType;
export 'package:flutter_common_exports/flutter_common_exports.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:openjmu_cms_web/openjmu_cms_web_routes.dart';

export '../apis/api.dart';
export '../extensions/extensions.e.dart';
export '../models/response_model.dart';
export '../utils/http_utils.dart';
export '../widgets/date_picker.dart';
export '../widgets/panel.dart';

export 'instances.dart';
export 'resources.dart';

const Color defaultColor = Color(0xFFE5322D);

ThemeData defaultTheme(BuildContext context) => ThemeData(
  primarySwatch: defaultColor.swatch,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    },
  ),
  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.zero,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
  cursorColor: defaultColor,
  textTheme: GoogleFonts.poppinsTextTheme(
    context.themeData.textTheme,
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
);