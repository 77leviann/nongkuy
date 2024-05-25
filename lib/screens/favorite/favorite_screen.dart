import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/widgets/custom_favorite_widget.dart';
import 'package:nongkuy/widgets/restaurant_grid_widget.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Restaurants',
          style: TextStyleConstant.headlineMedium(
            context,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
      ),
      body: Obx(() {
        if (favoriteController.favorites.isEmpty) {
          return const Center(
            child: Text(
              'No favorite restaurants yet.',
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: LayoutBuilder(
              builder: (
                BuildContext context,
                BoxConstraints constraints,
              ) {
                if (constraints.maxWidth <= 600) {
                  return RestaurantListWidget(
                    restaurants: favoriteController.favorites,
                    uniqueTag: 'favorite',
                  );
                } else if (constraints.maxWidth <= 960) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                    ),
                    child: RestaurantGridWidget(
                      restaurants: favoriteController.favorites,
                      gridCount: 2,
                      uniqueTag: 'favorite',
                    ),
                  );
                } else if (constraints.maxWidth <= 1200) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                    child: RestaurantGridWidget(
                      restaurants: favoriteController.favorites,
                      gridCount: 3,
                      uniqueTag: 'favorite',
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 160,
                    ),
                    child: RestaurantGridWidget(
                      restaurants: favoriteController.favorites,
                      gridCount: 4,
                      uniqueTag: 'favorite',
                    ),
                  );
                }
              },
            ),
          );
        }
      }),
    );
  }
}
