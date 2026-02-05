import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:yazz_player_app/models/song.dart';

class PlaylistProvider with ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: 'Heriye',
      artistName: 'Shael Oswal',
      albumArtImagePath: 'assets/images/Heriye.jpg',
      audioPath: 'mp3/Heriye.mp3',
    ),
    Song(
      songName: 'Paalu Yaame',
      artistName: 'Iman Fernando',
      albumArtImagePath: 'assets/images/paalu-yaame.jpg',
      audioPath: 'mp3/paalu-yaame.mp3',
    ),
    Song(
      songName: 'Pal Pal',
      artistName: 'Afusic',
      albumArtImagePath: 'assets/images/pal pal.jpg',
      audioPath: 'mp3/pal pal.mp3',
    ),
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  // make durations non-nullable
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;
  int _currentIndex = 0;

  PlaylistProvider() {
    listenToDuration();
  }

  // GETTERS
  List<Song> get playlist => _playlist;
  int get currentIndex => _currentIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // SETTERS
  set currentIndex(int newIndex) {
    if (newIndex >= 0 && newIndex < _playlist.length) {
      _currentIndex = newIndex;
      play();
      notifyListeners();
    }
  }

  // PLAYBACK FUNCTIONS
  void play() async {
    final path = _playlist[_currentIndex].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNext() {
    _currentIndex = (_currentIndex + 1) % _playlist.length;
    play();
  }

  void playPrevious() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero); // restart song
    } else {
      _currentIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
      play();
    }
  }

  // LISTENERS
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _currentDuration = _totalDuration;
      playNext();
      notifyListeners();
    });
  }
}
