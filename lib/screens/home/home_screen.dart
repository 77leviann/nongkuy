import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/enums/status_enum.dart';
import 'package:nongkuy/helpers/notification_helper.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';
import 'package:nongkuy/widgets/restaurant_grid_widget.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

part '../../constrollers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(
      HomeController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant List',
          style: TextStyleConstant.headlineMedium(
            context,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                NameRoutes.settingScreen,
              );
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(
                context,
              ).colorScheme.onPrimary,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
      ),
      body: Obx(() {
        switch (homeController.status.value) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.error:
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  homeController.errorMessage.value,
                ),
              ),
            );
          case Status.hasData:
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
                      restaurants: homeController.restaurantList,
                      uniqueTag: 'home',
                    );
                  } else if (constraints.maxWidth <= 960) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                      ),
                      child: RestaurantGridWidget(
                        restaurants: homeController.restaurantList,
                        gridCount: 2,
                        uniqueTag: 'home',
                      ),
                    );
                  } else if (constraints.maxWidth <= 1200) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                      ),
                      child: RestaurantGridWidget(
                        restaurants: homeController.restaurantList,
                        gridCount: 3,
                        uniqueTag: 'home',
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 160,
                      ),
                      child: RestaurantGridWidget(
                        restaurants: homeController.restaurantList,
                        gridCount: 4,
                        uniqueTag: 'home',
                      ),
                    );
                  }
                },
              ),
            );
          case Status.noData:
            return const Center(
              child: Text(
                'No data available',
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}
