import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yazz_player_app/compoonents/new_box.dart';
import 'package:yazz_player_app/models/playlistProvider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  // Helper method to format Duration (e.g., 00:00)
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // Get the current song
        final playlist = value.playlist;
        final currentSong = playlist[value.currentIndex];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Custom App Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text("P L A Y L I S T"),
                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// Album Art Section
                  NewBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            currentSong.albumArtImagePath,
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    currentSong.artistName,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              const Icon(Icons.favorite, color: Colors.red),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Song Progress Slider
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Current time
                            Text(formatTime(value.currentDuration)),
                            const Icon(Icons.shuffle),
                            const Icon(Icons.repeat),
                            // Total time
                            Text(formatTime(value.totalDuration)),
                          ],
                        ),
                      ),
                      
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          activeColor: Colors.green,
                          onChanged: (double newValue) {
                            // Optionally update UI during dragging
                          },
                          onChangeEnd: (double newValue) {
                            // Seek to the new position when dragging ends
                            value.seek(Duration(seconds: newValue.toInt()));
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// Playback Controls
                  Row(
                    children: [
                      // Previous button
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPrevious,
                          child: const NewBox(child: Icon(Icons.skip_previous)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Play/Pause button
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NewBox(
                            child: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Next button
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNext,
                          child: const NewBox(child: Icon(Icons.skip_next)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}