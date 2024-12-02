import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinit_interview/object/artwork/app/artwork.dart';

part 'artwork_list_state.freezed.dart';

@freezed
class ArtworkListState with _$ArtworkListState {
  const factory ArtworkListState.initial() = Initial;
  const factory ArtworkListState.loading({
    required List<Artwork> artworks,
    required bool hasMore,
  }) = Loading;
  const factory ArtworkListState.loaded({
    required List<Artwork> artworks,
    required bool hasMore,
  }) = Loaded;
  const factory ArtworkListState.error(String message) = Error;
}
