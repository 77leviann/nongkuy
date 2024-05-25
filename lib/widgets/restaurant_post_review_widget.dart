import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/enums/status_enum.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';

part '../constrollers/restaurant_post_review_controller.dart';

class RestaurantPostReviewWidget extends StatelessWidget {
  final String restaurantId;
  final VoidCallback? onReviewAdded;

  final RestaurantPostReviewController postReviewController = Get.put(
    RestaurantPostReviewController(),
  );

  RestaurantPostReviewWidget({
    super.key,
    required this.restaurantId,
    required this.onReviewAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.outline,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        children: [
          Obx(
            () => TextField(
              controller: postReviewController.nameController.value,
              onChanged: (
                value,
              ) =>
                  postReviewController.nameController.value.text = value,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: postReviewController.nameError.value.isNotEmpty
                    ? postReviewController.nameError.value
                    : null,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(
            () => TextField(
              controller: postReviewController.reviewController.value,
              onChanged: (
                value,
              ) =>
                  postReviewController.reviewController.value.text = value,
              decoration: InputDecoration(
                labelText: 'Review',
                errorText: postReviewController.reviewError.value.isNotEmpty
                    ? postReviewController.reviewError.value
                    : null,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              postReviewController
                  .postReview(
                restaurantId,
                postReviewController.nameController.value.text,
                postReviewController.reviewController.value.text,
              )
                  .then((
                _,
              ) {
                if (onReviewAdded != null) {
                  onReviewAdded!();
                }
              });
            },
            child: const Text(
              'Add Review',
            ),
          ),
        ],
      ),
    );
  }
}
