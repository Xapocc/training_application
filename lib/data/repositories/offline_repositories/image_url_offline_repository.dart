import 'package:training_application/data/models/image_url_model.dart';
import 'package:training_application/domain/entities/image_url_entity.dart';
import 'package:training_application/domain/mappers/image_url_mapper.dart';
import 'package:training_application/domain/repositories/image_url_repository_interface.dart';

class ImageUrlsOfflineRepositoryImpl implements IImageUrlRepository {
  @override
  List<ImageUrlEntity> getImageUls() {
    List<ImageUrlEntity> imageUrls = List.empty(growable: true);

    for (String item in _imagesCatsUrls) {
      imageUrls.add(ImageUrlMapper().mapImageUrl(ImageUrlModel(url: item)));
    }

    return imageUrls;
  }

  final List<String> _imagesCatsUrls = [
    "https://unsplash.com/photos/rW-I87aPY5Y/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/gKXKBY-C-Dk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/so5nsYDOdxw/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Nnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/mJaD10XeD7w/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/OzAeZPNsLXk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/NodtnCsLdTE/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8OHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/ZCHj_2lJP00/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8N3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/nKC772R_qog/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTF8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/LEpfefQf4rU/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTR8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/75715CVEJhI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTV8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
  ];
}
