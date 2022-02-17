import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poke_app/src/injector.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/app/theme/theme.dart';
import 'package:poke_app/src/presentation/pages/home_page/home_page.dart';
import 'package:poke_app/src/presentation/pages/splash_page/splash_page.dart';

Future<void> main() async {
  //TODO Apk icon
   WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(EasyDynamicThemeWidget(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: const SplashPage(),
      home:  const HomePage(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      color: PokeColor().softOrange,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
    
  }
}

