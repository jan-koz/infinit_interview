import 'package:dio/dio.dart';
import 'package:infinit_interview/core/dio/dio_config.dart';
import 'package:infinit_interview/object/event/api/event_api.dart';
import 'package:infinit_interview/object/paginated_response/paginated_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'events_api.g.dart';

@injectable
class EventsApi {
  final Dio dio;
  final IConfig config;
  final EventsApiClient _apiClient;

  EventsApi(this.dio, this.config)
      : _apiClient = EventsApiClient(dio, baseUrl: config.baseUrl);

  Future<PaginatedResponse<EventApi>> getPaginatedArtworks(
      {int page = 0, limit = 5}) {
    return _apiClient.getPaginatedEvents(page, limit);
  }
}

@RestApi()
abstract class EventsApiClient {
  @factoryMethod
  factory EventsApiClient(Dio dio, {String? baseUrl}) = _EventsApiClient;

  @GET('/events')
  Future<PaginatedResponse<EventApi>> getPaginatedEvents(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
