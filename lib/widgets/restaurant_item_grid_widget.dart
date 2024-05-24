import 'package:flutter/material.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/widgets/custom_favorite_widget.dart';
import 'package:nongkuy/widgets/restaurant_city_widget.dart';
import 'package:nongkuy/widgets/restaurant_image_widget.dart';
import 'package:nongkuy/widgets/restaurant_name_widget.dart';
import 'package:nongkuy/widgets/restaurant_rating_widget.dart';

class RestaurantItemGridWidget extends StatelessWidget {
  final String? pictureId;
  final String? name;
  final double? rating;
  final String? city;
  final String uniqueTag;
  final Restaurant? favorite;

  const RestaurantItemGridWidget({
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
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RestaurantNameWidget(
                    name: name,
                    maxLines: 1,
                  ),
                  FavoriteWidget(
                    restaurant: favorite!,
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              RestaurantCityWidget(
                city: city,
              ),
              const SizedBox(
                height: 6,
              ),
              RestaurantRatingWidget(
                rating: rating,
              )
            ],
          ),
        ],
      ),
    );
  }
}
