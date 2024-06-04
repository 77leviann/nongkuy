import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/widgets/restaurant_item_list_widget.dart';

class RestaurantListWidget extends StatelessWidget {
  final List<Restaurant>? restaurants;
  final String uniqueTag;

  const RestaurantListWidget({
    super.key,
    required this.restaurants,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants?.length ?? 0,
      itemBuilder: (
        context,
        index,
      ) {
        final restaurant = restaurants![index];
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              NameRoutes.detailScreen,
              arguments: {
                'restaurantId': restaurant.id ?? '',
                'uniqueTag': uniqueTag,
              },
            );
          },
          child: RestaurantItemListWidget(
            pictureId: restaurant.pictureId,
            name: restaurant.name,
            rating: restaurant.rating,
            city: restaurant.city,
            uniqueTag: uniqueTag,
            favorite: restaurant,
          ),
        );
      },
    );
  }
}
