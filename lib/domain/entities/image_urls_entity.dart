import 'package:training_application/data/models/image_urls_model.dart';

class ImageUrlsEntity {
  List<String> urls;

  ImageUrlsEntity({required this.urls});

  factory ImageUrlsEntity.fromModel(ImageUrlsModel imageUrlsModel) {
    return ImageUrlsEntity(urls: imageUrlsModel.urls);
  }
}
