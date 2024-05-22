part of 'restaurant_list_widget.dart';

class RestaurantCityWidget extends StatelessWidget {
  final String? city;

  const RestaurantCityWidget({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_rounded,
          size: 16,
          color: Theme.of(
            context,
          ).colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        city != null
            ? Text(
                city!,
                style: TextStyleConstant.labelMedium(
                  context,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : Text(
                'Unknown',
                style: TextStyleConstant.labelMedium(
                  context,
                ),
              ),
      ],
    );
  }
}
