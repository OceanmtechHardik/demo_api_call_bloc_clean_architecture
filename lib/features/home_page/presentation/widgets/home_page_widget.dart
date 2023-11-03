import 'package:demo_api_call_bloc_clean_architecture/di/get_it.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/entity/home_page_entity.dart';
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
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: state.homePageEnity.length,
      itemBuilder: (context, index) {
        final homePageData = state.homePageEnity[index];
        return commonListTile(homePageData: homePageData);
      },
    );
  }

  Widget commonListTile({required HomePageEntity homePageData}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  productImageview(homePageData: homePageData),
                  productDetailView(homePageData: homePageData),
                ],
              ),
            )),
      ),
    );
  }

  Widget productDetailView({required HomePageEntity homePageData}) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              homePageData.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            commonText(
              keyText: 'Category :',
              valueText: homePageData.averageRating,
            ),
            commonText(
              keyText: 'Price :',
              valueText: '₹${homePageData.discountPrice}',
            ),
            commonText(
              keyText: 'Rate :',
              valueText: homePageData.averageRating,
            ),
          ]),
    );
  }

  Widget productImageview({required HomePageEntity homePageData}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            fit: BoxFit.cover,
            homePageData.userProfile,
            errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  Widget commonText({
    required String keyText,
    required String valueText,
  }) {
    return Text.rich(
      TextSpan(
        text: keyText,
        style: const TextStyle(
          color: Color(0xff8D8D8D),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: valueText,
            style: const TextStyle(
              color: Color(0xff9D9D9D),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

Widget filterData() {
  return PopupMenuButton(
    itemBuilder: (context) {
      return [];
    },
  );
}
