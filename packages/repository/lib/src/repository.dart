import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network/network.dart';

part 'repository_service.dart';

/// A sub class of the Music Service
class Repository implements RepositoryService {
  /// Constructor will require the client
  const Repository({required this.client});

  /// Network client will be required to communicate with the api
  final NetworkClient client;

  /// loadRandomDogImages will load images of the dogs
  @override
  Future<Response> loadRandomDogImages({int pageNumber = 1}) async {
    var url = '${dotenv.env['API_URL']!}/breeds/image/random/$pageNumber';
    return await client.get(url, '');
  }
}
