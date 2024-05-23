import 'package:flutter/material.dart';
import 'package:nongkuy/constants/asset_constant.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:nongkuy/screens/detail/detail_screen.dart';
import 'package:nongkuy/widgets/custom_favorite_widget.dart';

part 'restaurant_image_widget.dart';
part 'restaurant_name_widget.dart';
part 'restaurant_rating_widget.dart';
part 'restaurant_city_widget.dart';
part 'restaurant_item_list_widget.dart';
part 'restaurant_item_grid_widget.dart';
part 'restaurant_grid_widget.dart';
part 'restaurant_description_widget.dart';
part 'restaurant_menu_widget.dart';
part 'restaurant_detail_item_widget.dart';
part 'restaurant_menu_item_widget.dart';

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
      itemBuilder: (context, index) {
        final restaurant = restaurants![index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    restaurant: restaurant,
                    uniqueTag: uniqueTag,
                  ),
                ),
              );
            },
            child: RestaurantItemListWidget(
              pictureId: restaurant.pictureId,
              name: restaurant.name,
              rating: restaurant.rating,
              city: restaurant.city,
              uniqueTag: uniqueTag,
            ));
      },
    );
  }
}
