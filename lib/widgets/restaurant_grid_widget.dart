part of 'restaurant_list_widget.dart';

class RestaurantGridWidget extends StatelessWidget {
  final List<Restaurant>? restaurants;
  final int gridCount;

  const RestaurantGridWidget({
    super.key,
    required this.restaurants,
    required this.gridCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: restaurants?.length ?? 0,
      itemBuilder: (context, index) {
        final restaurant = restaurants![index];
        return GestureDetector(
            onTap: () {},
            child: RestaurantItemGridWidget(
              pictureId: restaurant.pictureId,
              name: restaurant.name,
              rating: restaurant.rating.toString(),
              city: restaurant.city,
            ));
      },
    );
  }
}