import 'package:flutter/material.dart';

class PlaylistProvider with ChangeNotifier {
  List<String> _playlists = [];

  List<String> get playlists => _playlists;

  void addPlaylist(String playlistName) {
    _playlists.add(playlistName);
    notifyListeners();
  }

  void removePlaylist(String playlistName) {
    _playlists.remove(playlistName);
    notifyListeners();
  }
}