import '../../domain/entities/random_image.dart';
import '../../domain/repositories/image_repository.dart';
import '../datasources/remote_image_datasource.dart';

class ImageRepositoryImpl implements ImageRepository {
  final RemoteImageDataSource remote;

  ImageRepositoryImpl(this.remote);

  @override
  Future<RandomImage> getRandomImage() async {
    final url = await remote.fetchRandomImageUrl();
    return RandomImage(url: url);
  }
}
