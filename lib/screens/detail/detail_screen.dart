import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/enums/status_enum.dart';
import 'package:nongkuy/models/get_restaurant_detail_response_model.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';
import 'package:nongkuy/widgets/restaurant_post_review_widget.dart';
import 'package:nongkuy/widgets/restaurant_detail_item_widget.dart';

part '../../constrollers/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  final String restaurantId;
  final String uniqueTag;

  const DetailScreen({
    super.key,
    required this.restaurantId,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    final DetailController detailController = Get.put(
      DetailController(),
    );
    detailController.getRestaurantDetail(
      restaurantId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Restaurant',
          style: TextStyleConstant.headlineMedium(
            context,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(
              context,
            ).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Obx(
        () {
          switch (detailController.status.value) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    detailController.errorMessage.value,
                  ),
                ),
              );
            case Status.hasData:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    RestaurantDetailItemWidget(
                      restaurant:
                          detailController.restaurantDetail.value?.restaurant,
                      uniqueTag: uniqueTag,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: RestaurantPostReviewWidget(
                        restaurantId: restaurantId,
                        onReviewAdded: () {
                          detailController.getRestaurantDetail(restaurantId);
                        },
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
