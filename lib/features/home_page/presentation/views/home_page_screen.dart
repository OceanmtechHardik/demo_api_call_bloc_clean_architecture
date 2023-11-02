import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/widgets/homr_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends HomePageWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: homePageCubit,
        builder: (context, state) {
          if (state is HomePageLoadedState) {
            return loadedView(state: state);
          } else if (state is HomePageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
