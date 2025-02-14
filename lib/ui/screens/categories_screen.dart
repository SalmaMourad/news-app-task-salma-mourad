import 'package:flutter/material.dart';
import 'package:news_app_c13/core/theme_provider.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/ui/widgets/category_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/drawer.dart';


class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      drawer:  AppDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          // IconButton(
          //   icon: Icon(Icons.brightness_6),
          //   onPressed: () {
          //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();

          //     // themeProvider.toggleTheme(); // Toggle theme on button click
          //   },
          // ),
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode), // Switch icon
            onPressed: () {
              themeProvider.toggleTheme(); // 🔄 Toggle theme on click
            },
          ),
        ],
        title:  Text(
          AppLocalizations.of(context)!.home,
          // style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // actions: [

        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(textAlign: TextAlign.start,
                AppLocalizations.of(context)!.welcomeTitle,
                style: Theme.of(context).textTheme.labelLarge,
                // style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 24,
                //     fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ...CategoryModel.categories.map((e) => CategoryItem(
                  category: e, index: CategoryModel.categories.indexOf(e)))
            ],
          ),
        ),
      ),
    );
  }
}
