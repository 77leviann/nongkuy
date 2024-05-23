part of 'restaurant_list_widget.dart';

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
    return pictureId != null
        ? Hero(
            tag: '$uniqueTag-$pictureId',
            child: Image.network(
              pictureId!,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              colorBlendMode: BlendMode.darken,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Hero(
                  tag: '$uniqueTag-$pictureId',
                  child: Image.asset(
                    AssetConstant.imageNotFound,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    colorBlendMode: BlendMode.darken,
                  ),
                );
              },
            ),
          )
        : Hero(
            tag: '$uniqueTag-$pictureId',
            child: Image.asset(
              AssetConstant.imageNotFound,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              colorBlendMode: BlendMode.darken,
            ),
          );
  }
}
