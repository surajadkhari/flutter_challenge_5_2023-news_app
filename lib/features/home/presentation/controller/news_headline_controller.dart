import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../data/model/home_headline_model.dart';
import '../../data/repository/news_repositories.dart';

class NewsHeadlineController
    extends StateNotifier<AsyncValue<List<NewsModel>>> {
  final NewsRepositories newsRepositories;
  NewsHeadlineController(this.newsRepositories) : super(const AsyncLoading()) {
    getnewHeadlineC();
  }
  getnewHeadlineC() async {
    final result = await newsRepositories.getNewHeadlineRepo();
    return result.fold(
        (l) => AsyncError(l.message, StackTrace.fromString(l.message)),
        (r) => state = AsyncValue.data(r));
  }
}

final newsHeadLineControllerProvider =
    StateNotifierProvider<NewsHeadlineController, AsyncValue<List<NewsModel>>>(
        (ref) {
  return NewsHeadlineController(ref.read(newsRepositoriesProvider));
});
