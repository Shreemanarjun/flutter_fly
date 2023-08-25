import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_fly/app/view/app.dart';
import 'package:flutter_fly/bootstrap.dart';
import 'package:platform_info/platform_info.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// This entry point should be used for production only
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //You can override your environment variable in bootstrap method here for providers
  final path = await Platform.I.when(
        android: () async {
          return (await getApplicationDocumentsDirectory()).path;
        },
        orElse: () async => (await getDownloadsDirectory())?.path,
      ) ??
      "/";

  // device preview enable
  bootstrap(
    () => DevicePreview(
      enabled: !kReleaseMode,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
            onScreenshot: screenshotAsFiles(Directory(path))),
      ],
      builder: (context) => const App(),
    ),
  );
}
