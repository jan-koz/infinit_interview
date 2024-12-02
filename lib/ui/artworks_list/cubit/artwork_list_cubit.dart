import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/logic/artworks/artworks_repository.dart';
import 'package:infinit_interview/ui/artworks_list/cubit/artwork_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArtworkListCubit extends Cubit<ArtworkListState> {
  final ArtworksRepository _repository;

  ArtworkListCubit(this._repository) : super(const ArtworkListState.initial());

  Future<void> fetchArtworks() async {
    if (state is Loading) return;

    emit(ArtworkListState.loading(
        artworks: _repository.artworks, hasMore: _repository.hasMore));
    try {
      final artworks = await _repository.fetchNextPage();
      emit(ArtworkListState.loaded(
        artworks: artworks,
        hasMore: _repository.hasMore,
      ));
    } catch (error) {
      emit(ArtworkListState.error(error.toString()));
    }
  }
}
