import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../Database/datamode.dart';
import '../../main.dart';
import '../FolderScreen/videoslistview.dart';
import 'Widgets/play_list_videotile.dart';

class PLvideolist extends StatelessWidget {
  final String Playlistpath;
  PLvideolist({Key? key, required this.Playlistpath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Video  ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 25,
            ),
            Text(
              ' List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ValueListenableBuilder(
            valueListenable: videoPlaylistDB.listenable(),
            builder: (BuildContext context,
                Box<videoplaylistmode> videoPLlistenable, Widget? child) {
              return Expanded(
                  child: ListView.builder(
                itemCount: videoPLlistenable.length,
                itemBuilder: (context, index) {
                  videoplaylistmode? objplayvideo =
                      videoPlaylistDB.getAt(index);
                      print(videoPLlistenable..get(key));
                  if (objplayvideo!.playfolderlistname.toString() ==
                      Playlistpath) {
                    return PLonevideotile(
                        playlistvideoname: objplayvideo.PLvideopath,
                        index: index);
                  }

                  return SizedBox();
                },
              ));
            })
        // ,Center(
        //   child: Text("hai",colo),
        // )
      ],
    ));
  }
}
