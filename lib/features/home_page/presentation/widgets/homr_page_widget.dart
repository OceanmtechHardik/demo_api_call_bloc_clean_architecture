import 'package:demo_api_call_bloc_clean_architecture/di/get_it.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/views/home_page_screen.dart';
import 'package:flutter/material.dart';

abstract class HomePageWidget extends State<HomePageScreen> {
  late HomePageCubit homePageCubit;
  @override
  void initState() {
    homePageCubit = getItInstance<HomePageCubit>();
    homePageCubit.loadInitialData();
    super.initState();
  }

  @override
  void dispose() {
    homePageCubit.close();
    super.dispose();
  }

  Widget loadedView({required HomePageLoadedState state}) {
    return ListView.builder(
      itemCount: state.homePageEnity.length,
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text("hello"),
        );
      },
    );
  }
}
