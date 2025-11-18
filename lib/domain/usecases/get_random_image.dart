import '../entities/random_image.dart';
import '../repositories/image_repository.dart';

class GetRandomImage {
  final ImageRepository repository;

  GetRandomImage(this.repository);

  Future<RandomImage> call() async {
    return repository.getRandomImage();
  }
}
