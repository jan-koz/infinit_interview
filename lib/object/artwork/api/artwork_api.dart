import 'package:json_annotation/json_annotation.dart';

part 'artwork_api.g.dart';

@JsonSerializable()
class ArtworkApi {
  final int id;
  final String? title;
  @JsonKey(name: "api_link")
  final String? apiLink;
  @JsonKey(name: "date_display")
  final String? dateDisplay;
  @JsonKey(name: "artist_display")
  final String? artistDisplay;

  const ArtworkApi({
    required this.id,
    this.title,
    this.apiLink,
    this.dateDisplay,
    this.artistDisplay,
  });

  factory ArtworkApi.fromJson(Map<String, dynamic> json) =>
      _$ArtworkApiFromJson(json);

  Map<String, dynamic> toJson() => _$ArtworkApiToJson(this);
}
