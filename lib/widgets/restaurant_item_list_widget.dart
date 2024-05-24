import 'package:flutter/material.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/widgets/custom_favorite_widget.dart';
import 'package:nongkuy/widgets/restaurant_city_widget.dart';
import 'package:nongkuy/widgets/restaurant_image_widget.dart';
import 'package:nongkuy/widgets/restaurant_name_widget.dart';
import 'package:nongkuy/widgets/restaurant_rating_widget.dart';

class RestaurantItemListWidget extends StatelessWidget {
  final String? pictureId;
  final String? name;
  final double? rating;
  final String? city;
  final String uniqueTag;
  final Restaurant? favorite;

  const RestaurantItemListWidget({
    super.key,
    required this.pictureId,
    required this.name,
    required this.rating,
    required this.city,
    required this.uniqueTag,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          16,
        ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: 100,
                width: 120,
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
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      8,
                    ),
                  ),
                  child: RestaurantImageWidget(
                    pictureId: pictureId,
                    uniqueTag: uniqueTag,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RestaurantNameWidget(
                    name: name,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RestaurantCityWidget(
                    city: city,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RestaurantRatingWidget(
                    rating: rating,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: FavoriteWidget(
                restaurant: favorite!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
