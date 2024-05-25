import 'package:flutter/material.dart';

class RestaurantMenuItemWidget extends StatelessWidget {
  final String? menu;

  const RestaurantMenuItemWidget({
    super.key,
    required this.menu,
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
            color: Theme.of(
              context,
            ).colorScheme.primaryContainer,
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
          child: Text(
            menu!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
