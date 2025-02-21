// // so is this actually implements pagegination?
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:news_app_c13/data/models/newsResponse/Articles.dart';

// import '../data/models/newsResponse/NewsResponse.dart';
// import '../ui/widgets/news_item.dart';
// // import 'package:news_app_c13/data/models/news_response.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// class SearchScreen extends StatefulWidget {
//   static const routeName = '/search';

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// // class _SearchScreenState extends State<SearchScreen> {
// //   final TextEditingController _searchController = TextEditingController();
// //   final Dio _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));
// //   bool _isLoading = false;
// //   List<NewsArticle> _searchResults = [];

// //   Future<void> _searchNews(String query) async {
// //     if (query.isEmpty) return;

// //     setState(() {
// //       _isLoading = true;
// //     });

// //     try {
// //       var response = await _dio.get(
// //         "/v2/everything",
// //         queryParameters: {
// //           "apiKey": "4bbb9e6d66614137aa67978c62cefaa7",
// //           "q": query, // User input
// //           "sortBy": "popularity",
// //         },
// //       );

// //       var newsResponse = NewsResponse.fromJson(response.data);
// //       setState(() {
// //         _searchResults = newsResponse.articles ?? [];
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _searchResults = [];
// //       });
// //     }

// //     setState(() {
// //       _isLoading = false;
// //     });
// //   }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final Dio _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));
//   bool _isLoading = false;
//   List<NewsArticle> _searchResults = [];
//   int _currentPage = 1;
//   bool _isFetchingMore = false;
//   String _currentQuery = "";
//   final ScrollController _scrollController = ScrollController();

//   Future<void> _searchNews(String query, {int page = 1}) async {
//     if (query.isEmpty) return;

//     if (page == 1) {
//       setState(() {
//         _isLoading = true;
//         _searchResults.clear();
//         _currentQuery = query;
//         _currentPage = 1;
//       });
//     } else {
//       setState(() {
//         _isFetchingMore = true;
//       });
//     }

//     try {
//       var response = await _dio.get(
//         "/v2/everything",
//         queryParameters: {
//           "apiKey": "4effb6709123457a9db8a2ac8e287b6a",
//           "q": query,
//           "sortBy": "popularity",
//           "page": page, // Pagination parameter
//           "pageSize": 10 // Number of results per page
//         },
//       );

//       var newsResponse = NewsResponse.fromJson(response.data);
//       setState(() {
//         if (page == 1) {
//           _searchResults = newsResponse.articles ?? [];
//         } else {
//           _searchResults.addAll(newsResponse.articles ?? []);
//         }
//         _currentPage = page;
//       });
//     } catch (e) {
//       print(e);
//       if (page == 1) {
//         setState(() {
//           _searchResults = [];
//         });
//       }
//     }

//     setState(() {
//       _isLoading = false;
//       _isFetchingMore = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//           _scrollController.position.maxScrollExtent - 3) {
//         _loadMore();
//       }
//     });
//   }

//   void _loadMore() {
//     if (!_isFetchingMore) {
//       _searchNews(_currentQuery, page: _currentPage + 1);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: TextField(
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 18),
//               controller: _searchController,
//               decoration: InputDecoration(
//                 suffixIcon: Icon(Icons.search),
//                 hintStyle: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 18),
//                 hintText: "Search news...",
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(color: Colors.black)),
//               ),
//               onChanged: (query) {
//                 _searchNews(query);
//               },
//             ),
//           ),
//           _isLoading
//               ? Center(child: CircularProgressIndicator())
//               : _searchResults.isEmpty
//                   ? Center(child: Text("No results found"))
//                   : Expanded(
//                       child: ListView.builder(
//                         controller: _scrollController, // Add scroll controller
//                         itemCount: _searchResults.length +
//                             1, // Extra item for loading indicator

//                         // itemCount: _searchResults.length,
//                         // itemBuilder: (context, index) {
//                         //   var article = _searchResults[index];
//                         //   return NewsItem(article: article);
//                         // }
//                         itemBuilder: (context, index) {
//                           if (index == _searchResults.length) {
//                             return _isFetchingMore
//                                 ? Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Center(
//                                         child: CircularProgressIndicator()),
//                                   )
//                                 : SizedBox.shrink();
//                           }
//                           var article = _searchResults[index];
//                           return NewsItem(article: article);
//                         },
//                       ),
//                     ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'package:news_app_c13/data/models/newsResponse/Articles.dart';

// // import '../data/models/newsResponse/NewsResponse.dart';
// // import '../ui/widgets/news_item.dart';
// // // import 'package:news_app_c13/data/models/news_response.dart';
// // // import 'package:webview_flutter/webview_flutter.dart';

// // class SearchScreen extends StatefulWidget {
// //   static const routeName = '/search';

// //   @override
// //   _SearchScreenState createState() => _SearchScreenState();
// // }

// // // class _SearchScreenState extends State<SearchScreen> {
// // //   final TextEditingController _searchController = TextEditingController();
// // //   final Dio _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));
// // //   bool _isLoading = false;
// // //   List<NewsArticle> _searchResults = [];

// // //   Future<void> _searchNews(String query) async {
// // //     if (query.isEmpty) return;

// // //     setState(() {
// // //       _isLoading = true;
// // //     });

// // //     try {
// // //       var response = await _dio.get(
// // //         "/v2/everything",
// // //         queryParameters: {
// // //           "apiKey": "4bbb9e6d66614137aa67978c62cefaa7",
// // //           "q": query, // User input
// // //           "sortBy": "popularity",
// // //         },
// // //       );

// // //       var newsResponse = NewsResponse.fromJson(response.data);
// // //       setState(() {
// // //         _searchResults = newsResponse.articles ?? [];
// // //       });
// // //     } catch (e) {
// // //       setState(() {
// // //         _searchResults = [];
// // //       });
// // //     }

// // //     setState(() {
// // //       _isLoading = false;
// // //     });
// // //   }

// // class _SearchScreenState extends State<SearchScreen> {
// //   final TextEditingController _searchController = TextEditingController();
// //   final Dio _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));
// //   bool _isLoading = false;
// //   List<NewsArticle> _searchResults = [];
// //   int _currentPage = 1;
// //   bool _isFetchingMore = false;
// //   String _currentQuery = "";
// //   final ScrollController _scrollController = ScrollController();

// //   Future<void> _searchNews(String query, {int page = 1}) async {
// //     if (query.isEmpty) return;

// //     if (page == 1) {
// //       setState(() {
// //         _isLoading = true;
// //         _searchResults.clear();
// //         _currentQuery = query;
// //         _currentPage = 1;
// //       });
// //     }
// // //     if (page == 1) {
// // //   setState(() {
// // //     _isLoading = true;
// // //     _searchResults.clear();
// // //     _currentQuery = query;
// // //     _currentPage = 1;
// // //     _isFetchingMore = false; // Reset this when starting a new search
// // //   });
// // // }

// //      else {
// //       setState(() {
// //         _isFetchingMore = true;
// //       });
// //     }

// //     try {
// //       var response = await _dio.get(
// //         "/v2/everything",
// //         queryParameters: {
// //           "apiKey": "4effb6709123457a9db8a2ac8e287b6a",
// //           "q": query,
// //           "sortBy": "popularity",
// //           "page": page, // Pagination parameter
// //           "pageSize": 10 // Number of results per page
// //         },
// //       );

// //       var newsResponse = NewsResponse.fromJson(response.data);
// //       setState(() {
// //         if (page == 1) {
// //           _searchResults = newsResponse.articles ?? [];
// //         } else {
// //           _searchResults.addAll(newsResponse.articles ?? []);
// //         }
// //         _currentPage = page;
// //       });
// //     } catch (e) {
// //       if (page == 1) {
// //         setState(() {
// //           _searchResults = [];
// //         });
// //       }
// //     }

// //     setState(() {
// //       _isLoading = false;
// //       _isFetchingMore = false;
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _scrollController.addListener(() {
// //       if (_scrollController.position.pixels >=
// //           _scrollController.position.maxScrollExtent - 200) {
// //         _loadMore();
// //       }
// //     });
// //   }

// //   void _loadMore() {
// //     if (!_isFetchingMore) {
// //       _searchNews(_currentQuery, page: _currentPage + 1);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(15.0),
// //             child: TextField(
// //               style: TextStyle(
// //                   color: Colors.black,
// //                   fontWeight: FontWeight.normal,
// //                   fontSize: 18),
// //               controller: _searchController,
// //               decoration: InputDecoration(
// //                 suffixIcon: Icon(Icons.search),
// //                 hintStyle: TextStyle(
// //                     color: Colors.black,
// //                     fontWeight: FontWeight.normal,
// //                     fontSize: 18),
// //                 hintText: "Search news...",
// //                 border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(50),
// //                     borderSide: BorderSide(color: Colors.black)),
// //               ),
// //               onChanged: (query) {
// //                 _searchNews(query);
// //               },
// //             ),
// //           ),
// //           _isLoading
// //               ? Center(child: CircularProgressIndicator())
// //               : _searchResults.isEmpty
// //                   ? Center(child: Text("No results found"))
// //                   : Expanded(
// //                       child: ListView.builder(
// //                         controller: _scrollController, // Add scroll controller
// //                         itemCount: _searchResults.length +
// //                             1, // Extra item for loading indicator

// //                         // itemCount: _searchResults.length,
// //                         // itemBuilder: (context, index) {
// //                         //   var article = _searchResults[index];
// //                         //   return NewsItem(article: article);
// //                         // }
// //                         itemBuilder: (context, index) {
// //                           if (index == _searchResults.length) {
// //                             return _isFetchingMore
// //                                 ? Padding(
// //                                     padding: const EdgeInsets.all(10),
// //                                     child: Center(
// //                                         child: CircularProgressIndicator()),
// //                                   )
// //                                 : SizedBox.shrink();
// //                           }
// //                           var article = _searchResults[index];
// //                           return NewsItem(article: article);
// //                         },
// //                       ),
// //                     ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// //  // ListTile(
// //                             //   title: Text(article.title ?? ""),
// //                             //   subtitle: Text(article.source?.name ?? ""),
// //                             //   onTap: () {
// //                             //     // Navigator.push(
// //                             //     //   context,
// //                             //     //   MaterialPageRoute(
// //                             //     //     builder: (context) => WebViewScreen(article.url!),
// //                             //     //   ),
// //                             //     // );
// //                             //   },
// //                             // );
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'search_news_provider.dart';

// // // class SearchScreen extends StatelessWidget {
// // //   static const routeName = '/home';

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ChangeNotifierProvider(
// // //       create: (_) => SearchNewsProvider(),
// // //       child: SearchNewsView(),
// // //     );
// // //   }
// // // }

// // // class SearchNewsView extends StatefulWidget {
// // //   @override
// // //   _SearchNewsViewState createState() => _SearchNewsViewState();
// // // }

// // // class _SearchNewsViewState extends State<SearchNewsView> {
// // //   final TextEditingController _searchController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final searchProvider = Provider.of<SearchNewsProvider>(context);

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("Search News"),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           // Search Bar
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: TextField(
// // //               controller: _searchController,
// // //               decoration: InputDecoration(
// // //                 labelText: "Search for news...",
// // //                 border: OutlineInputBorder(),
// // //                 prefixIcon: Icon(Icons.search),
// // //               ),
// // //               onChanged: (query) {
// // //                 searchProvider.searchNews(query); // Call search function
// // //               },
// // //             ),
// // //           ),

// // //           // Loading Indicator
// // //           if (searchProvider.isLoading) CircularProgressIndicator(),

// // //           // Error Message
// // //           if (searchProvider.errorMessage.isNotEmpty)
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: Text(
// // //                 searchProvider.errorMessage,
// // //                 style: TextStyle(color: Colors.red),
// // //               ),
// // //             ),

// // //           // News List
// // //           Expanded(
// // //             child: ListView.builder(
// // //               itemCount: searchProvider.articles.length,
// // //               itemBuilder: (context, index) {
// // //                 final article = searchProvider.articles[index];
// // //                 return ListTile(
// // //                   leading: article.urlToImage != null
// // //                       ? Image.network(article.urlToImage!, width: 80, height: 80, fit: BoxFit.cover)
// // //                       : Icon(Icons.image_not_supported),
// // //                   title: Text(article.title ?? "No Title"),
// // //                   subtitle: Text(article.source?.name ?? "Unknown Source"),
// // //                   onTap: () {
// // //                     // Open full article
// // //                     _openArticle(context, article.url);
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void _openArticle(BuildContext context, String? url) {
// // //     if (url != null) {
// // //       // Navigator.push(
// // //       //   context,
// // //       //   MaterialPageRoute(
// // //       //     builder: (context) => WebViewScreen(url: url),
// // //       //   ),
// // //       // );
// // //     }
// // //   }
// // // }
