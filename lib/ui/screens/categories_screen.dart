import 'package:flutter/material.dart';
import 'package:news_app_c13/core/prov.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/ui/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      drawer: const Drawer(),
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
        title: const Text(
          'Home',
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
                "Good Morning \nHere is Some News For You",
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
