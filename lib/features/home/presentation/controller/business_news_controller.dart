import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/home_headline_model.dart';
import '../../data/repository/news_repositories.dart';

class BusinessNewController extends StateNotifier<AsyncValue<List<NewsModel>>> {
  final NewsRepositories newsRepositories;
  BusinessNewController(this.newsRepositories) : super(const AsyncLoading()) {
    getBusinessNews();
  }
  getBusinessNews() async {
    final result = await newsRepositories.getBusinessNewsRepo();
    return result.fold(
        (l) => AsyncError(l.message, StackTrace.fromString(l.message)),
        (r) => state = AsyncValue.data(r));
  }
}

final businessNewControllerProvider =
    StateNotifierProvider<BusinessNewController, AsyncValue<List<NewsModel>>>(
        (ref) {
  return BusinessNewController(ref.read(newsRepositoriesProvider));
});
