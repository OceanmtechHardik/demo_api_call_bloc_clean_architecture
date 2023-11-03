part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {
  const HomePageInitialState();

  @override
  List<Object> get props => [];
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState();

  @override
  List<Object> get props => [];
}

class HomePageLoadedState extends HomePageState {
  final List<HomePageEntity> homePageEnity;
  const HomePageLoadedState({required this.homePageEnity});

  @override
  List<Object> get props => [homePageEnity];
}

class HomePageErrorState extends HomePageState {
  final AppErrorType appErrorType;
  final String errorMessage;

  const HomePageErrorState({required this.appErrorType, required this.errorMessage});

  @override
  List<Object> get props => [appErrorType, errorMessage];
}
