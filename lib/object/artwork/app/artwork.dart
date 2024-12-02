import 'package:infinit_interview/object/artwork/api/artwork_api.dart';

class Artwork {
  final int id;
  final String? title;
  final String? apiLink;
  final String? dateDisplay;
  final String? artistDisplay;

  Artwork({
    required this.id,
    this.title,
    this.apiLink,
    this.dateDisplay,
    this.artistDisplay,
  });

  factory Artwork.fromApi(ArtworkApi api) {
    return Artwork(
      id: api.id,
      title: api.title,
      apiLink: api.apiLink,
      dateDisplay: api.dateDisplay,
      artistDisplay: api.artistDisplay,
    );
  }

  ArtworkApi toApi() {
    return ArtworkApi(
      id: id,
      title: title,
      apiLink: apiLink,
      dateDisplay: dateDisplay,
      artistDisplay: artistDisplay,
    );
  }
}
