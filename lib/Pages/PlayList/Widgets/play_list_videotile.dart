import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Database/datamode.dart';
import '../../../main.dart';
import '../../../videoplayer/thumbnail.dart';
import '../../../videoplayer/widget/Project/allvideoplayer.dart';
import '../../Add favou/remove_tile.dart';

class PLonevideotile extends StatelessWidget {
  final String playlistvideoname;
  final int index;
  const PLonevideotile(
      {Key? key, required this.playlistvideoname, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object");
    double _w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: _w / 15),
      height: _w / 4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          List<String> list = getList(videoPlaylistDB.values.toList());

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AllvideoPlayer(
                urls: list,
                index: index,
              ),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: Text(
                  playlistvideoname.toString().split('/').last,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SizedBox(
            height: 200,
            width: 90,
            child: FutureBuilder(
              future: getThumbnail(playlistvideoname),
              builder: (context, AsyncSnapshot<String?> snapshot) =>
                  snapshot.hasData
                      ? Image.file(File(snapshot.data!))
                      :  Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/images/croplogo.jpg'))),
                          ),
                        ),
            ),
          ),
        ),
        trailing:getPlaylistPop(index: index)
      ),
    );
  }

  getList(List<videoplaylistmode> objList) {
    List<String> videoPath = [];
    for (videoplaylistmode obj in objList) {
      videoPath.add(obj.PLvideopath);
    }
    return videoPath;
  }
}
