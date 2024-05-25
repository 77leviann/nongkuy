import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';

class RestaurantReviewItemWidget extends StatelessWidget {
  final String? customerReview;
  final String? customerReviewName;
  final String? customerReviewDate;
  final String? customerReviewComment;

  const RestaurantReviewItemWidget({
    super.key,
    required this.customerReview,
    required this.customerReviewName,
    required this.customerReviewDate,
    required this.customerReviewComment,
  });

  @override
  Widget build(BuildContext context) {
    String? leadingImageText;
    if (customerReviewName != null && customerReviewName!.isNotEmpty) {
      leadingImageText = customerReviewName![0].toUpperCase();
    }
    return customerReview != null
        ? ListTile(
            leading: CircleAvatar(
              child: Text(
                leadingImageText ?? '',
                style: TextStyleConstant.labelMedium(context),
              ),
            ),
            title: Text(
              customerReviewName!,
            ),
            subtitle: Text(
              customerReviewComment!,
            ),
            trailing: Text(
              customerReviewDate!,
              style: TextStyleConstant.labelMedium(
                context,
              )?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.outline,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
