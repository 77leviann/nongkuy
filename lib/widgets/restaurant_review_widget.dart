import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/models/get_restaurant_detail_response_model.dart';
import 'package:nongkuy/widgets/restaurant_review_item_widget.dart';

class RestaurantReviewWidget extends StatelessWidget {
  final Restaurant? restaurant;

  const RestaurantReviewWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Customer Review',
            style: TextStyleConstant.bodyLarge(
              context,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurant?.customerReviews?.length ?? 0,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final review = restaurant!.customerReviews![index];
            return RestaurantReviewItemWidget(
              customerReview: restaurant?.customerReviews.toString(),
              customerReviewName: review.name,
              customerReviewComment: review.review,
              customerReviewDate: review.date,
            );
          },
        ),
      ],
    );
  }
}
