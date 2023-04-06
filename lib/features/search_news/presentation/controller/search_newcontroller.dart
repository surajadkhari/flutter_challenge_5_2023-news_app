import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/model/home_headline_model.dart';
import '../../../home/data/repository/news_repositories.dart';

class SearchNewsController extends StateNotifier<AsyncValue<List<NewsModel>>> {
  final NewsRepositories newsRepositories;
  final String searchQuery;
  SearchNewsController(
      {required this.newsRepositories, required this.searchQuery})
      : super(const AsyncValue.loading()) {
    getsearchNewC();
  }
  getsearchNewC() async {
    final result = await newsRepositories.getsearchNewsRepo(searchQuery);
    return result.fold(
        (l) => state =
            AsyncValue.error(l.message, StackTrace.fromString(l.message)),
        (r) => state = AsyncValue.data(r));
  }
}

final searchNewsControllerProvider = StateNotifierProvider.family<
    SearchNewsController, AsyncValue<List<NewsModel>>, String>((ref, query) {
  return SearchNewsController(
      newsRepositories: ref.read(newsRepositoriesProvider), searchQuery: query);
});
