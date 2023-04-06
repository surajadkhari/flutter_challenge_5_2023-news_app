import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../data/model/home_headline_model.dart';
import '../../data/repository/news_repositories.dart';

class SportNewsController extends StateNotifier<AsyncValue<List<NewsModel>>> {
  final NewsRepositories newsRepositories;
  SportNewsController(this.newsRepositories) : super(const AsyncLoading()) {
    getSportNews();
  }
  getSportNews() async {
    final result = await newsRepositories.getSportNewsRepo();
    return result.fold(
        (l) => AsyncError(l.message, StackTrace.fromString(l.message)),
        (r) => state = AsyncValue.data(r));
  }
}

final sportNewsControllerProvider =
    StateNotifierProvider<SportNewsController, AsyncValue<List<NewsModel>>>(
        (ref) {
  return SportNewsController(ref.read(newsRepositoriesProvider));
});
