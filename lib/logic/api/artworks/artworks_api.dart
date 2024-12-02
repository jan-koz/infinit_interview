import 'package:dio/dio.dart';
import 'package:infinit_interview/core/dio/dio_config.dart';
import 'package:infinit_interview/object/paginated_response/paginated_response.dart';
import 'package:infinit_interview/object/artwork/api/artwork_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'artworks_api.g.dart';

@injectable
class ArtworksApi {
  final Dio dio;
  final IConfig config;
  final ArtworksApiClient _apiClient;

  ArtworksApi(this.dio, this.config)
      : _apiClient = ArtworksApiClient(dio, baseUrl: config.baseUrl);

  Future<PaginatedResponse<ArtworkApi>> getPaginatedArtworks(
      {required int page, required int limit}) {
    return _apiClient.getPaginatedArtworks(page, limit);
  }
}

@RestApi()
abstract class ArtworksApiClient {
  @factoryMethod
  factory ArtworksApiClient(Dio dio, {String? baseUrl}) = _ArtworksApiClient;

  @GET('/artworks')
  Future<PaginatedResponse<ArtworkApi>> getPaginatedArtworks(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
