part of 'restaurant_list_widget.dart';

class RestaurantMenuItemWidget extends StatelessWidget {
  final String? restaurant;

  const RestaurantMenuItemWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(
              8,
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 2,
            ),
          ),
          child: Text(
            restaurant!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
