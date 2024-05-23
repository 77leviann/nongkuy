part of 'restaurant_list_widget.dart';

class RestaurantImageWidget extends StatelessWidget {
  final String? pictureId;

  const RestaurantImageWidget({super.key, required this.pictureId});

  @override
  Widget build(BuildContext context) {
    return pictureId != null
        ? Image.network(
            pictureId!,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            colorBlendMode: BlendMode.darken,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Image.asset(
                AssetConstant.imageNotFound,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                colorBlendMode: BlendMode.darken,
              );
            },
          )
        : Image.asset(
            AssetConstant.imageNotFound,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            colorBlendMode: BlendMode.darken,
          );
  }
}
