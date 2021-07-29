part of 'repository.dart';

/// This class will handle only repository related to the api
abstract class RepositoryService {
  /// loadRandomDogImages will load images of the dogs
  Future<Response> loadRandomDogImages({int pageNumber = 1});
}
