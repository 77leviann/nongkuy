import 'package:flutter/material.dart';
import 'package:nongkuy/constants/asset_constant.dart';
import 'package:nongkuy/utils/base_url_util.dart';

class RestaurantImageWidget extends StatelessWidget {
  final String? pictureId;
  final String uniqueTag;

  const RestaurantImageWidget({
    super.key,
    required this.pictureId,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    String? fullImageUrl =
        pictureId != null ? '${BaseUrlUtil.baseImageUrl}/$pictureId' : null;

    return fullImageUrl != null
        ? Hero(
            tag: '$uniqueTag-$pictureId',
            child: Image.network(
              fullImageUrl,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              colorBlendMode: BlendMode.darken,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  AssetConstant.imageNotFound,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.darken,
                );
              },
            ),
          )
        : Image.asset(
          AssetConstant.imageNotFound,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          colorBlendMode: BlendMode.darken,
        );
  }
}
