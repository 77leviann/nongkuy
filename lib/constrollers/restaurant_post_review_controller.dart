part of '../widgets/restaurant_post_review_widget.dart';

class RestaurantPostReviewController extends GetxController {
  Rx<Status> status = Status.idle.obs;
  RxString errorMessage = ''.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> reviewController = TextEditingController().obs;
  RxString nameError = RxString(
    '',
  );
  RxString reviewError = RxString(
    '',
  );

  final restaurantService = RestaurantService();

  @override
  void onInit() {
    super.onInit();
    nameController.value = TextEditingController();
    reviewController.value = TextEditingController();
  }

  Future<void> postReview(String id, String name, String review) async {
    try {
      nameError.value = '';
      reviewError.value = '';

      if (name.isEmpty) {
        nameError.value = 'Name cannot be empty';
        return;
      }
      if (review.isEmpty) {
        reviewError.value = 'Review cannot be empty';
        return;
      }
      status(Status.loading);
      final response = await restaurantService.postRestaurantReview(
        id,
        name,
        review,
      );
      if (response.error == false) {
        status(Status.hasData);
        Get.snackbar(
          'Success',
          response.message ?? 'Review added successfully',
        );
      } else {
        throw response.message ?? 'Failed to add review';
      }
    } catch (e) {
      handleError(
        e,
      );
    }
  }

  void handleError(
    dynamic e,
  ) {
    status(
      Status.error,
    );
    errorMessage(
      e.toString(),
    );
  }
}
