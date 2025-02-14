import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/lang_provider.dart';
import '../../core/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final local = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                textAlign: TextAlign.center,
                local.newsapp,
                style:Theme.of(context).textTheme.bodyLarge ,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(local.goToHome,style: Theme.of(context).textTheme.bodyMedium,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),

          // Theme Switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(local.theme,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          // IconButton(
          //   icon: Icon(themeProvider.themeMode == ThemeMode.light
          //       ? Icons.dark_mode
          //       : Icons.light_mode), // Switch icon
          //   onPressed: () {
          //     themeProvider.toggleTheme(); //  Toggle theme on click
          //   },
          // ),
          // ThemeDropdownButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<ThemeMode>(
              isExpanded: true,

              value: themeProvider.themeMode,
              icon: Icon(Icons.arrow_drop_down_outlined), 
              onChanged: (ThemeMode? newMode) {
                if (newMode != null) {
                  themeProvider.toggleTheme();
                }
              },
              items: [
                DropdownMenuItem(
                  
                  value: ThemeMode.light,
                  child: Row(
                    children: [
                      Icon(Icons.light_mode),
                      SizedBox(width: 8),
                      Text(local.lightmode,style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Row(
                    children: [
                      Icon(Icons.dark_mode),
                      SizedBox(width: 8),
                      Text(local.darkmode,style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
              ],
            ),
          ),

         
          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(local.language,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              value: languageProvider.locale.languageCode,
              isExpanded: true,
              onChanged: (String? newValue) {
                // if (newValue == 'en') {
                //   languageProvider.setLocale(Locale('en'));
                // } else {
                //   languageProvider.setLocale(Locale('ar'));
                // }
              },
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English',style: Theme.of(context).textTheme.bodyMedium,),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية',style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ThemeDropdownButton extends StatefulWidget {
  @override
  _ThemeDropdownButtonState createState() => _ThemeDropdownButtonState();
}

class _ThemeDropdownButtonState extends State<ThemeDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PopupMenuButton<ThemeMode>(
      icon: Icon(themeProvider.themeMode == ThemeMode.light
          ? Icons.dark_mode
          : Icons.light_mode), 
      onSelected: (ThemeMode mode) {
        themeProvider.toggleTheme();
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Text('Light'),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Text('Dark'),
        ),
      ],
    );
  }
}
