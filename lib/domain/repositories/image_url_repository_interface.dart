import 'package:training_application/domain/entities/image_url_entity.dart';

abstract class IImageUrlRepository {
  Future<List<ImageUrlEntity>> getImageUls();
}
