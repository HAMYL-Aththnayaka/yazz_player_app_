import 'package:flutter/material.dart';
import 'package:yazz_player_app/models/song.dart';

class PlaylistProvider with ChangeNotifier {

  final List<song> _songPlaylost = [

  song(
    songName: 'Song 1',
    artistName: 'Artist 1',
    albumName: 'Album 1',
    duration: '3:45',
  ),

  ];
}