import 'package:dartz/dartz.dart';
import 'package:demo_api_call_bloc_clean_architecture/app_errors.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/entity/home_page_entity.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/perams/no_params_file.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/usecases/get_home_page_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  GetHomePageData getHomePageData;
  HomePageCubit({required this.getHomePageData}) : super(const HomePageLoadedState(homePageEnity: []));

  Future<void> loadInitialData() async {
    Either<AppError, List<HomePageEntity>> response = await getHomePageData(NoParams());
    response.fold(
      (error) {
        if (kDebugMode) {
          print("Something went wrong");
        }
      },
      (data) {
        print("object");
        emit(HomePageLoadedState(homePageEnity: data));
      },
    );
  }
}
