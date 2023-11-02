import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/widgets/homr_page_widget.dart';
import 'package:flutter/material.dart';

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
        title: Text("HomePage", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile();
        },
      ),
    );
  }
}
