import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yazz_player_app/compoonents/new_box.dart';
import 'package:yazz_player_app/models/playlistProvider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        if (value.currentIndex == null) {
          return const Scaffold(body: Center(child: Text('No song selected')));
        }

        final song = value.playlist[value.currentIndex!];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 🔙 Custom App Bar
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          song.songName,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// 🎵 Album Section
                  NewBox(
                    child: Column(
                      children: [
                        Image.asset(
                          song.albumArtImagePath,
                          width: 220,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          song.artistName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              song.songName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(Icons.favorite_border, size: 28),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// ⏱ Time + Controls
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('0:00'),
                        Icon(Icons.shuffle),
                        Icon(Icons.repeat),
                        Text('3:45'),
                      ],
                    ),
                  ),

                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                    ),
                    child: Slider(
                      value: 30,
                      min: 0,
                      max: 100,
                      onChanged: (_) {},
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: NewBox(
                           child: Icon(Icons.skip_previous, size: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: NewBox(
                            child: Icon(
                              Icons.play_circle, size: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                         
                          child: NewBox(
                            child: Icon(Icons.skip_next, size: 40)),
                          
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
