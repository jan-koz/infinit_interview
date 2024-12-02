import 'package:infinit_interview/logic/api/events/events_api.dart';
import 'package:infinit_interview/object/event/app/event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EventsRepository {
  final EventsApi _eventsApi;

  EventsRepository(this._eventsApi);

  Future<List<Event>> fetchEvents() async {
    return (await _eventsApi.getPaginatedArtworks())
        .items
        .map((e) => Event.fromApi(e))
        .toList();
  }
}
