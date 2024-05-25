import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';

class RestaurantCategoriesWidget extends StatelessWidget {
  final String? categories;

  const RestaurantCategoriesWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return categories != null
        ? Text(
            '(${categories.toString()})',
            style: TextStyleConstant.bodyMedium(
              context,
            )?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.outline,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            'Unknown',
            style: TextStyleConstant.bodyMedium(
              context,
            )?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.outline,
            ),
          );
  }
}
