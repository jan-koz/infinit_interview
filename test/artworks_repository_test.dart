import 'package:flutter_test/flutter_test.dart';
import 'package:infinit_interview/logic/artworks/artworks_repository.dart';
import 'package:infinit_interview/object/artwork/api/artwork_api.dart';
import 'package:infinit_interview/object/paginated_response/paginated_response.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:infinit_interview/logic/api/artworks/artworks_api.dart';

@GenerateNiceMocks([
  MockSpec<ArtworksApi>(),
])
import 'artworks_repository_test.mocks.dart';

void main() {
  late MockArtworksApi mockArtworksApi;
  late ArtworksRepository artworksRepository;

  setUp(() {
    mockArtworksApi = MockArtworksApi();
    artworksRepository = ArtworksRepository(mockArtworksApi);
  });

  group('ArtworksRepository', () {
    test('fetchNextPage fetches artworks and updates state correctly',
        () async {
      // Arrange
      final mockPaginatedResponse = PaginatedResponse<ArtworkApi>(
        items: const [
          ArtworkApi(id: 1, title: "Artwork 1"),
          ArtworkApi(id: 2, title: "Artwork 2"),
        ],
        total: 20,
        totalPages: 2,
        currentPage: 1,
        hasMore: true,
        nextUrl: null,
      );

      when(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .thenAnswer((_) async => Future.value(mockPaginatedResponse));

      // Act
      final result = await artworksRepository.fetchNextPage();

      // Assert
      expect(result.length, 2);
      expect(result.first.title, "Artwork 1");
      expect(artworksRepository.hasMore, true);
      verify(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .called(1);
    });

    test('fetchNextPage handles end of pagination correctly', () async {
      // Arrange
      final mockPaginatedResponse = PaginatedResponse<ArtworkApi>(
        items: const [
          ArtworkApi(id: 3, title: "Artwork 3"),
        ],
        total: 10,
        totalPages: 1,
        currentPage: 0,
        hasMore: false,
        nextUrl: null,
      );

      when(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .thenAnswer((_) async => Future.value(mockPaginatedResponse));

      // Act
      final result = await artworksRepository.fetchNextPage();

      // Assert
      expect(result.length, 1);
      expect(result.first.title, "Artwork 3");
      expect(artworksRepository.hasMore, true);
      verify(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .called(1);
    });

    test('resetPagination resets pagination and clears state', () async {
      // Arrange
      final mockPaginatedResponse = PaginatedResponse<ArtworkApi>(
        items: const [
          ArtworkApi(id: 4, title: "Artwork 4"),
        ],
        total: 20,
        totalPages: 2,
        currentPage: 1,
        hasMore: true,
        nextUrl: null,
      );

      when(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .thenAnswer((_) async => Future.value(mockPaginatedResponse));

      // Act
      await artworksRepository.fetchNextPage();
      artworksRepository.resetPagination();

      // Assert
      expect(artworksRepository.artworks, isEmpty);
      expect(artworksRepository.hasMore, true);
      verify(mockArtworksApi.getPaginatedArtworks(page: 0, limit: 10))
          .called(1);
    });
  });
}
