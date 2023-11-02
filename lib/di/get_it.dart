import 'package:demo_api_call_bloc_clean_architecture/core/api_client.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/data/data_sources/home_page_sources.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  // Analytics Property
  // getItInstance.registerLazySingleton<AnalyticsService>(() => AnalyticsService());

  //Data source Dependency
  // getItInstance.registerLazySingleton<DmtRemoteDataSource>(() => DmtRemoteDataSourceImpl(client: getItInstance()));
   getItInstance.registerLazySingleton<HomePageSource>(() => HomePageSourceImpl(client: getItInstance()));

  //Data Repository Dependency
  // getItInstance.registerLazySingleton<DMTRemoteRepository>(() => DMTRemoteRepositoryImpl(dmtRemoteDataSource: getItInstance()));

  //Usecase Dependency
  // getItInstance.registerLazySingleton<GetAppLanguageList>(() => GetAppLanguageList(dmtRepository: getItInstance()));

  //Cubit Dependency
  // getItInstance.registerLazySingleton<BottomNavigationCubit>(() => BottomNavigationCubit());
  // getItInstance.registerFactory<OfferCubit>(() => OfferCubit());
  getItInstance.registerFactory<HomePageCubit>(() => HomePageCubit());
}
