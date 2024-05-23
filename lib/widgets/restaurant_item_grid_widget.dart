part of 'restaurant_list_widget.dart';

class RestaurantItemGridWidget extends StatelessWidget {
  final String? pictureId;
  final String? name;
  final double? rating;
  final String? city;

  const RestaurantItemGridWidget({
    super.key,
    required this.pictureId,
    required this.name,
    required this.rating,
    required this.city,
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
                child: RestaurantImageWidget(pictureId: pictureId),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestaurantNameWidget(
                name: name,
                maxLines: 1,
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
