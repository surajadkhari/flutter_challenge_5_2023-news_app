import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api_exception.dart/api_exception.dart';
import '../../../../core/app_error/app_error.dart';
import '../data_source/news_data_source.dart';
import '../model/home_headline_model.dart';

abstract class NewsRepositories {
  Future<Either<AppError, List<NewsModel>>> getNewHeadlineRepo();
  Future<Either<AppError, List<NewsModel>>> getBusinessNewsRepo();
  Future<Either<AppError, List<NewsModel>>> getSportNewsRepo();
  Future<Either<AppError, List<NewsModel>>> getsearchNewsRepo(
      String searchQuery);
}

class NewsRepositoriesImpl implements NewsRepositories {
  final NewsDataSource newsDataSource;
  NewsRepositoriesImpl(this.newsDataSource);

  @override
  Future<Either<AppError, List<NewsModel>>> getNewHeadlineRepo() async {
    try {
      final result = await newsDataSource.getNewHeadlineDS();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }

  @override
  Future<Either<AppError, List<NewsModel>>> getBusinessNewsRepo() async {
    try {
      final result = await newsDataSource.getBusinessNewsDs();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }

  @override
  Future<Either<AppError, List<NewsModel>>> getSportNewsRepo() async {
    try {
      final result = await newsDataSource.getSportNewsDS();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }

  @override
  Future<Either<AppError, List<NewsModel>>> getsearchNewsRepo(
      String searchQuery) async {
    try {
      final result = await newsDataSource.getsearchNewsDS(searchQuery);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}

final newsRepositoriesProvider = Provider<NewsRepositories>((ref) {
  return NewsRepositoriesImpl(ref.read(newsDataSourceProvider));
});
