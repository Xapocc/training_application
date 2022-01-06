import 'package:training_application/data/models/image_url_model.dart';
import 'package:training_application/domain/entities/image_url_entity.dart';

class ImageUrlMapper {
  ImageUrlEntity mapImageUrl(ImageUrlModel imageUrlModel) =>
      ImageUrlEntity(url: imageUrlModel.url);
}
