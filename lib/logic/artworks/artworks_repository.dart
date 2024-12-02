import 'package:infinit_interview/logic/api/artworks/artworks_api.dart';
import 'package:infinit_interview/object/artwork/app/artwork.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ArtworksRepository {
  final ArtworksApi _artworkApi;
  int _currentPage = 0;
  final int _limit = 10;
  bool _hasMore = true;
  final List<Artwork> artworks = [];

  ArtworksRepository(this._artworkApi);

  Future<List<Artwork>> fetchNextPage() async {
    if (!_hasMore) return artworks;

    final artworkApiList = await _artworkApi.getPaginatedArtworks(
      page: _currentPage,
      limit: _limit,
    );

    if (artworkApiList.currentPage == artworkApiList.totalPages) {
      _hasMore = false;
    } else {
      _currentPage++;
      artworks.addAll(artworkApiList.items.map((e) => Artwork.fromApi(e)));
    }

    return artworks;
  }

  void resetPagination() {
    _currentPage = 0;
    _hasMore = true;
    artworks.clear();
  }

  bool get hasMore => _hasMore;
}
