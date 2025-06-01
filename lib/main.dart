import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

import 'di.dart';
import 'presentation/pages/movie_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    
  ]);
  runApp(EasyLocalization(

      supportedLocales: const [
        Locale('ar', 'US'),
        Locale('en', 'DE')
        ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      child: const MyApp()
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: MoviePage(),
    );
  }
}
