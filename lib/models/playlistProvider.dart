import 'package:flutter/material.dart';
import 'package:yazz_player_app/models/song.dart';

class PlaylistProvider with ChangeNotifier {

  final List<Song> _playlist = [

  Song(
    songName: 'Song 1',
    artistName: 'Artist 1',
    albumArtImagePath: 'assets/images/Heriye.png',
    audioPath: 'assets/mp3/Heriye.mp3',
  ),

  ];

  int ? _currentIndex;

  //getter 
  List<Song> get playlist=> _playlist;
  int? get currentIndex => _currentIndex;

//setter
set currentIndex(int? newIndex){
  _currentIndex = newIndex;

//ipdate ui
notifyListeners();
}


}