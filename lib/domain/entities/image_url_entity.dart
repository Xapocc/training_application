import 'package:training_application/data/models/image_url_model.dart';

class ImageUrlEntity {
  String url;

  ImageUrlEntity({required this.url});

  factory ImageUrlEntity.fromModel(ImageUrlModel imageUrlModel) {
    return ImageUrlEntity(url: imageUrlModel.url);
  }
}
