import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';

class RestaurantAddressWidget extends StatelessWidget {
  final String? address;

  const RestaurantAddressWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return address != null
        ? Text(
            ' - ${address!}',
            style: TextStyleConstant.labelMedium(
              context,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            'Unknown',
            style: TextStyleConstant.labelMedium(
              context,
            ),
          );
  }
}
