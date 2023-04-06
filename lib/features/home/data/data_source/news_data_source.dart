import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api_client/api_client.dart';
import '../model/home_headline_model.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getNewHeadlineDS();
  Future<List<NewsModel>> getBusinessNewsDs();
  Future<List<NewsModel>> getSportNewsDS();
  Future<List<NewsModel>> getsearchNewsDS(String searchQuery);
}

class NewsDataSouceImpl implements NewsDataSource {
  final ApiClient apiClient;
  NewsDataSouceImpl(this.apiClient);
  @override
  Future<List<NewsModel>> getNewHeadlineDS() async {
    final result = await apiClient.request(path: "top-headlines?country=us");
    List data = result["articles"];
    return data.map((e) => NewsModel.fromMap(e)).toList();
  }

  @override
  Future<List<NewsModel>> getBusinessNewsDs() async {
    final result = await apiClient.request(
        path: "top-headlines?country=us&category=business");
    List data = result["articles"];
    return data.map((e) => NewsModel.fromMap(e)).toList();
  }

  @override
  Future<List<NewsModel>> getSportNewsDS() async {
    final result = await apiClient.request(
        path: "top-headlines?country=us&category=sports");
    List data = result["articles"];
    return data.map((e) => NewsModel.fromMap(e)).toList();
  }

  @override
  Future<List<NewsModel>> getsearchNewsDS(String searchQuery) async {
    String endPoint = searchQuery.isEmpty
        ? "top-headlines?q=a"
        : "top-headlines?q=$searchQuery";
    final result = await apiClient.request(path: endPoint);
    List data = result["articles"];

    return data.map((e) => NewsModel.fromMap(e)).toList();
  }
}

final newsDataSourceProvider = Provider<NewsDataSource>((ref) {
  return NewsDataSouceImpl(ref.read(apiClientProvider));
});
