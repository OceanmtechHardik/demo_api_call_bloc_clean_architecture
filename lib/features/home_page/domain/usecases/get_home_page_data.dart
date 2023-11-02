import 'package:dartz/dartz.dart';
import 'package:demo_api_call_bloc_clean_architecture/app_errors.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/perams/no_params_file.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/repositories/home_page_repositiries.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/usecases/usecase.dart';

class GetHomePageData extends UseCase {
 final HomePageRemoteRepositories homePageRemoteRepositories;

 GetHomePageData({required this.homePageRemoteRepositories});

  @override
  Future<Either<AppError, dynamic>> call(NoParams params) {
    return homePageRemoteRepositories.getHomePageData(noParams: params);
  }
}
