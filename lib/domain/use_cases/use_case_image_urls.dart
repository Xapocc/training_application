import 'package:training_application/domain/entities/image_urls_entity.dart';
import 'package:training_application/domain/repositories/image_urls_repository_interface.dart';

class ImageUrlsUseCase {
  ImageUrlsUseCase({required this.repository});

  final IImageUrlsRepository repository;

  ImageUrlsEntity getImageUls() {
    return repository.getImageUls();
  }
}