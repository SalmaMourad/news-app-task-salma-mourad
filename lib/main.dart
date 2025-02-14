import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/core/app_theme.dart';
import 'package:news_app_c13/core/prov.dart';
import 'package:news_app_c13/ui/screens/categories_screen.dart';
import 'package:news_app_c13/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MainApp(),
    ),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
// var t=Theme.of(context).textTheme.bodyLarge;
  @override
  Widget build(BuildContext context) {
        final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
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
