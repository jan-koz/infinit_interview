import 'package:flutter/material.dart';
import 'package:infinit_interview/object/artwork/app/artwork.dart';

class ArtworkDetailsScreen extends StatelessWidget {
  final Artwork artwork;

  const ArtworkDetailsScreen({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artwork.title ?? 'Artwork Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artwork.title ?? 'Unknown Title',
            ),
            const SizedBox(height: 8),
            Text(
              'Artist: ${artwork.artistDisplay ?? 'Unknown Artist'}',
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (artwork.apiLink != null)
                    Text(
                      'Api link: ${artwork.apiLink}',
                    ),
                  if (artwork.dateDisplay != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Date: ${artwork.dateDisplay}',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
