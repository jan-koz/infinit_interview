import 'package:json_annotation/json_annotation.dart';

part 'event_api.g.dart';

@JsonSerializable()
class EventApi {
  final int id;
  final String? title;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "start_time")
  final String? startTime;

  const EventApi({
    required this.id,
    this.title,
    this.imageUrl,
    this.shortDescription,
    this.location,
    this.startTime,
  });

  factory EventApi.fromJson(Map<String, dynamic> json) =>
      _$EventApiFromJson(json);

  Map<String, dynamic> toJson() => _$EventApiToJson(this);
}
