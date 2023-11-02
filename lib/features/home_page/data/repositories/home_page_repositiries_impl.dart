import 'package:dartz/dartz.dart';
import 'package:demo_api_call_bloc_clean_architecture/app_errors.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/data/data_sources/home_page_sources.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/entity/home_page_entity.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/perams/no_params_file.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/repositories/home_page_repositiries.dart';

class HomePageRempositiriesImpl extends HomePageRemoteRepositories {
  final HomePageSource homePageSource;
  HomePageRempositiriesImpl({required this.homePageSource});

  @override
  Future<Either<AppError, List<HomePageEntity>>> getHomePageData({required NoParams noParams}) async {
    try {
      final result = await homePageSource.getHomePageData(noParams: noParams);
      return result;
    } on Exception {
      throw Exception('Something goes wrong.');
    }
  }
}
