part of 'restaurant_list_widget.dart';

class RestaurantItemListWidget extends StatelessWidget {
  final String? pictureId;
  final String? name;
  final double? rating;
  final String? city;
  final String uniqueTag;

  const RestaurantItemListWidget({
    super.key,
    required this.pictureId,
    required this.name,
    required this.rating,
    required this.city,
    required this.uniqueTag,
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
          children: [
            Container(
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
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
