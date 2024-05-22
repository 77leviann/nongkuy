part of 'restaurant_list_widget.dart';

class RestaurantNameWidget extends StatelessWidget {
  final String? name;
  final int maxLines;

  const RestaurantNameWidget({
    super.key,
    required this.name,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? '',
      style: TextStyleConstant.bodyLarge(
        context,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
