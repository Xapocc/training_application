import 'package:training_application/domain/entities/image_url_entity.dart';
import 'package:training_application/domain/repositories/image_url_repository_interface.dart';

class ImageUrlsUseCase {
  ImageUrlsUseCase({required this.repository});

  final IImageUrlRepository repository;

  List<ImageUrlEntity> getImageUls() {
    return repository.getImageUls();
  }
}
