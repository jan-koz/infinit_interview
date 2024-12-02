import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/core/di/dependencies_container.dart';
import 'package:infinit_interview/ui/artworks_list/cubit/artwork_list_cubit.dart';
import 'package:infinit_interview/ui/artworks_list/cubit/artwork_list_state.dart';
import 'package:infinit_interview/ui/artworks_list/view/components/artwork_details_screen.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:infinit_interview/object/artwork/app/artwork.dart';

class ArtworkListPage extends StatelessWidget {
  const ArtworkListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artworks'),
      ),
      body: BlocProvider<ArtworkListCubit>(
        create: (_) => getIt.get<ArtworkListCubit>()..fetchArtworks(),
        child: BlocBuilder<ArtworkListCubit, ArtworkListState>(
          builder: (context, state) {
            switch (state) {
              case Initial():
                return const Center(child: Text('No data loaded.'));
              case Error():
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Error: ${state.message}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<ArtworkListCubit>().fetchArtworks(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              case Loading():
                return _ArtworkPagedListView(
                    artworks: state.artworks, hasMore: state.hasMore);
              case Loaded():
                return _ArtworkPagedListView(
                    artworks: state.artworks, hasMore: state.hasMore);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _ArtworkPagedListView extends StatelessWidget {
  final List<Artwork> artworks;
  final bool hasMore;
  const _ArtworkPagedListView({required this.artworks, required this.hasMore});

  @override
  Widget build(BuildContext context) {
    return PaginatedList<Artwork>(
      items: artworks,
      builder: (artwork, index) {
        return ListTile(
          title: Text(artwork.title ?? "placeholder"),
          subtitle: Text(artwork.artistDisplay ?? "placeholder"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArtworkDetailsScreen(artwork: artwork),
              ),
            );
          },
        );
      },
      onLoadMore: (index) => context.read<ArtworkListCubit>().fetchArtworks(),
      isLastPage: hasMore == false,
      isRecentSearch: false,
      loadingIndicator: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
