import 'package:flutter/material.dart';
import 'package:nongkuy/models/get_restaurant_detail_response_model.dart';
import 'package:nongkuy/widgets/restaurant_address_widget.dart';
import 'package:nongkuy/widgets/restaurant_categories_widget.dart';
import 'package:nongkuy/widgets/restaurant_city_widget.dart';
import 'package:nongkuy/widgets/restaurant_description_widget.dart';
import 'package:nongkuy/widgets/restaurant_image_widget.dart';
import 'package:nongkuy/widgets/restaurant_menu_widget.dart';
import 'package:nongkuy/widgets/restaurant_name_widget.dart';
import 'package:nongkuy/widgets/restaurant_rating_widget.dart';
import 'package:nongkuy/widgets/restaurant_review_widget.dart';

class RestaurantDetailItemWidget extends StatelessWidget {
  final Restaurant? restaurant;
  final String uniqueTag;

  const RestaurantDetailItemWidget({
    super.key,
    required this.restaurant,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RestaurantImageWidget(
                pictureId: restaurant?.pictureId,
                uniqueTag: uniqueTag,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(
                        context,
                      ).colorScheme.onInverseSurface.withOpacity(
                            0.9,
                          ),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(
                  8,
                ),
                color: Theme.of(
                  context,
                ).colorScheme.surface,
                child: RestaurantRatingWidget(
                  rating: restaurant?.rating,
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Row(
                children: [
                  RestaurantCityWidget(
                    city: restaurant?.city,
                  ),
                  RestaurantAddressWidget(
                    address: restaurant?.address,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RestaurantNameWidget(
                    name: restaurant?.name,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RestaurantCategoriesWidget(
                    categories: restaurant?.categories?.first.name,
                  )
                ],
              ),
              RestaurantDescriptionWidget(
                description: restaurant?.description,
              ),
              const SizedBox(
                height: 4,
              ),
              RestaurantMenuWidget(
                restaurant: restaurant,
              ),
              const SizedBox(
                height: 16,
              ),
              RestaurantReviewWidget(
                restaurant: restaurant,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
