import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/enums/status_enum.dart';
import 'package:nongkuy/models/get_restaurant_search_response_model.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';
import 'package:nongkuy/widgets/restaurant_city_widget.dart';
import 'package:nongkuy/widgets/restaurant_image_widget.dart';
import 'package:nongkuy/widgets/restaurant_name_widget.dart';

part '../../constrollers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchController controller = Get.put(
    SearchController(),
  );

  SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Restaurant',
          style: TextStyleConstant.headlineMedium(
            context,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              onSubmitted: (
                value,
              ) {
                controller.search(
                  value,
                );
              },
              decoration: InputDecoration(
                hintText: 'Search Restaurant...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    controller.search(
                      controller.searchController.text,
                    );
                  },
                ),
                contentPadding: const EdgeInsets.all(
                  8,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Obx(
                () {
                  switch (controller.status.value) {
                    case Status.idle:
                      return SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              size: 100,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                            const Text(
                              'Find your favorite restaurant here!',
                            ),
                          ],
                        ),
                      );
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.hasData:
                      return ListView.separated(
                        separatorBuilder: (
                          context,
                          index,
                        ) =>
                            const SizedBox(
                          height: 8,
                        ),
                        itemCount: controller.restaurantList.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          var restaurant = controller.restaurantList[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.outlineVariant,
                                width: 2,
                              ),
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      8,
                                    ),
                                  ),
                                ),
                                child: RestaurantImageWidget(
                                  pictureId: restaurant.pictureId,
                                  uniqueTag: 'uniqueTag',
                                ),
                              ),
                              title: RestaurantNameWidget(
                                name: restaurant.name ?? '',
                                maxLines: 2,
                              ),
                              subtitle: RestaurantCityWidget(
                                city: restaurant.city,
                              ),
                              onTap: () {
                                Get.toNamed(
                                  NameRoutes.detailScreen,
                                  arguments: {
                                    'restaurantId': restaurant.id ?? '',
                                    'uniqueTag': 'uniqueTag',
                                  },
                                )?.then(
                                  (
                                    _,
                                  ) {
                                    controller.clearResults();
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    case Status.noData:
                      return const Center(
                        child: Text(
                          'No restaurants found.',
                        ),
                      );
                    case Status.error:
                      return const Center(
                        child: Text(
                          'Error occurred. Please check your internet connection.',
                        ),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
