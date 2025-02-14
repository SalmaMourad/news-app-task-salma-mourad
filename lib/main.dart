import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/core/app_theme.dart';
import 'package:news_app_c13/core/lang_provider.dart';
import 'package:news_app_c13/core/theme_provider.dart';
import 'package:news_app_c13/ui/screens/categories_screen.dart';
import 'package:news_app_c13/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '.dart_tool\flutter_gen\gen_l10n\app_localizations.dart';
// import '../generated/l10n.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// var t=Theme.of(context).textTheme.bodyLarge;
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      // locale: languageProvider.locale,
      locale:Locale('ar'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.dark,
      themeMode: themeProvider.themeMode,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: CategoriesScreen.routeName,
    );
  }
}
