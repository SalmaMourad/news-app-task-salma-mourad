// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import '../data/models/newsResponse/Articles.dart';
// import '../data/models/newsResponse/NewsResponse.dart';
// // import 'news_response.dart'; // Your model class

// class SearchNewsProvider with ChangeNotifier {
//   final Dio _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org")); // API Base URL
//   bool isLoading = false;
//   List<NewsArticle> articles = []; // Store fetched articles
//   String errorMessage = "";

//   Future<void> searchNews(String query) async {
//     if (query.isEmpty) return;

//     isLoading = true;
//     errorMessage = "";
//     notifyListeners();

//     try {
//       var response = await _dio.get(
//         "/v2/everything",
//         queryParameters: {
//           "apiKey": "4bbb9e6d66614137aa67978c62cefaa7",
//           "q": query,
//           "from": "2025-02-19",
//           "to": "2025-02-20",
//           "sortBy": "popularity",
//         },
//       );

//       var newsResponse = NewsResponse.fromJson(response.data);
//       articles = newsResponse.articles ?? [];
//     } catch (e) {
//       errorMessage = "Failed to load news. Try again.";
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
