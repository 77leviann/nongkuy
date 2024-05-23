part of 'restaurant_list_widget.dart';

class RestaurantDescriptionWidget extends StatelessWidget {
  final String? description;

  const RestaurantDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? '',
      style: TextStyleConstant.bodyMedium(
        context,
      ),
      overflow: TextOverflow.fade,
    );
  }
}
