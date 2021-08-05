import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './repository/settings_repository.dart' as settingRepo;
import 'fitnessAppHomeScreen.dart';
import 'generated/l10n.dart';
import 'models/CustomGrid.dart';
import 'utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  settingRepo.getLanguageCode().then((value) {
    runApp(MyWidget(
      languageCode: value,
    ));
  });
}

class MyWidget extends StatelessWidget {
  final languageCode;

  MyWidget({this.languageCode});

  final List<CustomGrid> grid = CustomGrid.widgetList();

  @override
  Widget build(BuildContext context) {
    settingRepo.locale.value = Locale(languageCode);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return ValueListenableBuilder(
        valueListenable: settingRepo.locale,
        builder: (context, value, _) {
          return MaterialApp(
            title: "Flutter UI",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: AppTheme.textTheme,
              platform: TargetPlatform.iOS,
            ),
            locale: value as Locale?,
            localizationsDelegates: [
              // ... app-specific localization delegate[s] here
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: Scaffold(
              body: FitnessAppHomeScreen(),
              //    resizeToAvoidBottomPadding: false,
            ),
          );
        });
  }
}
