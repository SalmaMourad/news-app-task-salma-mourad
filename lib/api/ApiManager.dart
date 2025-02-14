import 'package:dio/dio.dart';
import 'package:news_app_c13/data/models/newsResponse/NewsResponse.dart';
import 'package:news_app_c13/data/models/sourceResponse/SourcesResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager{ // singleton
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org",
      connectTimeout: const Duration(seconds: 120),
    )
  );

  ApiManager._(){
    _dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
            enabled: true,
        )
    );
  }

  static ApiManager? _apiManager;

  static ApiManager getInstance(){
    return _apiManager ??= ApiManager._();
  }
  
  Future<SourcesResponse?> getNewsSources(String category)async{
    var response = await _dio.get("/v2/top-headlines/sources",
    queryParameters: {
      "apiKey":"4bbb9e6d66614137aa67978c62cefaa7",//5909ae28122a471d8b0c237d5989cb73
      "category" : category
    });
    var sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }

  Future<NewsResponse?> getNews(String sourceId)async{
    var response = await _dio.get("/v2/everything",
    queryParameters: {
      "apiKey":"4bbb9e6d66614137aa67978c62cefaa7",
      "sources" : sourceId
    });
    var newsResponse = NewsResponse.fromJson(response.data);
    return newsResponse;
  }
}