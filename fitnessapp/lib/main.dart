import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/screen/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './repository/settings_repository.dart' as settingRepo;
import 'fitnessAppHomeScreen.dart';
import 'generated/l10n.dart';
import 'models/CustomGrid.dart';
import 'models/user_data.dart';
import 'services/auth_service.dart';
import 'utilities/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  settingRepo.getLanguageCode().then((value) {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserData(),
          ),
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MyApp(
          languageCode: value,
        )));
  });
}

class MyApp extends StatelessWidget {
  final languageCode;

  MyApp({this.languageCode});

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
              body: Appointments(),
              //    resizeToAvoidBottomPadding: false,
            ),
          );
        });
  }
}
