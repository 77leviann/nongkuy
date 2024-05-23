part of 'restaurant_list_widget.dart';

class RestaurantMenuWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantMenuWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Foods',
          style: TextStyleConstant.bodyLarge(
            context,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: restaurant.menus?.foods?.length ?? 0,
            itemBuilder: (context, index) {
              return RestaurantMenuItemWidget(
                restaurant: restaurant.menus!.foods![index].name ?? '',
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Drinks',
          style: TextStyleConstant.bodyLarge(
            context,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: restaurant.menus?.drinks?.length ?? 0,
            itemBuilder: (context, index) {
              return RestaurantMenuItemWidget(
                restaurant: restaurant.menus!.drinks![index].name ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
