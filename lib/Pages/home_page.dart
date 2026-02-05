import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yazz_player_app/Pages/song_Page.dart';
import 'package:yazz_player_app/compoonents/my_drawer.dart';
import 'package:yazz_player_app/models/playlistProvider.dart';
import 'package:yazz_player_app/models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

late final dynamic playlistProvider;
void initState() {
  super.initState();

  //update playlistProvider
  playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);

  }
//go to song
void goToSong(int songIndex){
  playlistProvider.currentIndex = songIndex;

//navigate to song page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SongPage()),
);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('PLAY LIST'),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];

              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(
                  song.albumArtImagePath, // must be an asset path
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  // play song
                  goToSong(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
