import 'package:infinit_interview/object/event/api/event_api.dart';

class Event {
  final int id;
  final String? title;
  final String? imageUrl;
  final String? shortDescription;
  final String? location;
  final String? startTime;

  Event({
    required this.id,
    this.title,
    this.imageUrl,
    this.shortDescription,
    this.location,
    this.startTime,
  });

  factory Event.fromApi(EventApi api) {
    return Event(
      id: api.id,
      title: api.title,
      imageUrl: api.imageUrl,
      shortDescription: api.shortDescription,
      location: api.location,
      startTime: api.startTime,
    );
  }

  EventApi toApi() {
    return EventApi(
      id: id,
      title: title,
      imageUrl: imageUrl,
      shortDescription: shortDescription,
      location: location,
      startTime: startTime,
    );
  }
}
