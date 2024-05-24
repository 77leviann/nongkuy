import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';

class RestaurantRatingWidget extends StatelessWidget {
  final double? rating;

  const RestaurantRatingWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: Theme.of(
            context,
          ).colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        rating != null
            ? Text(
                rating!.toString(),
                style: TextStyleConstant.labelMedium(
                  context,
                ),
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
