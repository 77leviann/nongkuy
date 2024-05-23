part of 'restaurant_list_widget.dart';

class RestaurantDetailItemWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailItemWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: RestaurantImageWidget(pictureId: restaurant.pictureId),
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
                        ).colorScheme.onInverseSurface.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16.0,
                right: 16.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(
                    context,
                  ).colorScheme.surface,
                  child: RestaurantRatingWidget(
                    rating: restaurant.rating,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: RestaurantCityWidget(
                  city: restaurant.city,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestaurantNameWidget(
                  name: restaurant.name,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 4,
                ),
                RestaurantDescriptionWidget(
                  description: restaurant.description,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                RestaurantMenuWidget(
                  restaurant: restaurant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
