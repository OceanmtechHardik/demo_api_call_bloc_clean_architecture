import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/widgets/home_page_widget.dart';
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
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          centerTitle: false,
          title: Text("Oceanmtech", style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
              onPressed: () => filterData(),
              icon: const Icon(Icons.filter_alt),
            ),
            const SizedBox(width: 20),
          ],
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
        ));
  }
}
