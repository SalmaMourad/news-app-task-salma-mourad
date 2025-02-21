import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/ui/screens/NewsSourcesView.dart';
import 'package:news_app_c13/ui/widgets/LoadingWidget.dart';
import '../../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  CategoryModel? _category; // Make nullable

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is CategoryModel) {
        setState(() {
          _category = args;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
  onPressed: () {
    Navigator.pushNamed(context, SearchScreen.routeName);
  },
  icon: const Icon(Icons.search, size: 30),
),

          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, SearchScreen.routeName);
          //   },
          //   icon: const Icon(Icons.search, size: 30),
          // ),
        ],
        title: Text(_category?.name ?? "Default Category"),
      ),
      body: _category == null
          ? Center(child: Text("No category selected"))
          : FutureBuilder(
              future: ApiManager.getInstance().getNewsSources(_category!.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget();
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                var sources = snapshot.data?.sources;
                return Newssourcesview(sources ?? []);
              },
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:news_app_c13/api/ApiManager.dart';
// import 'package:news_app_c13/data/models/category.dart';
// import 'package:news_app_c13/ui/screens/NewsSourcesView.dart';
// import 'package:news_app_c13/ui/widgets/LoadingWidget.dart';

// import '../../search/search_screen.dart';

// class HomeScreen extends StatefulWidget {
//   static const routeName = '/home';
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late CategoryModel _category;



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Scaffold(
//         appBar: AppBar(
//           actions: [IconButton(
//               onPressed: () {Navigator.pushNamed(
//         context,
//         SearchScreen.routeName,
//         // arguments: category,
//       );},
//               icon: const Icon(
//                 Icons.search,
//                 size: 30,
//               )),],
//           title: Text(_category.name),
//         ),
//         body: FutureBuilder(future: ApiManager.getInstance().getNewsSources(
//           _category.id
//         ),
//             builder: (context, snapshot) {
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return LoadingWidget();
//           }else if(snapshot.hasError){
//             return Center(child: Text(snapshot.error.toString()),);
//           }
//           var sources = snapshot.data?.sources;
//           return Newssourcesview(sources ?? []);
//             },)
//         ),
//       );
//   }


//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
//   }
// }
