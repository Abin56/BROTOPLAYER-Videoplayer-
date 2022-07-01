import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Database/datamode.dart';
import '../../../main.dart';
import '../../../videoplayer/thumbnail.dart';
import '../../../videoplayer/widget/Project/allvideoplayer.dart';
import '../Add favou/remove_tile.dart';
bool boolrec = false;
class RecentVideoList extends StatelessWidget {
  final String playlistvideoname;
  final int index;
  const RecentVideoList(
      {Key? key, required this.playlistvideoname, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
Recentlistingmode? obj = recentDB.getAt(index);

    print("object");
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
            List<String> list = getList();

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
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 200,
              width: 90,
              child: FutureBuilder(
                                        future:
                                        
                                            getThumbnail(obj!.recentpath),
                                        builder: (context,
                                                AsyncSnapshot<String?>
                                                    snapshot) =>
                                            snapshot.hasData
                                                ? Image.file(
                                                    File(snapshot.data!))
                                                : Center(
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(image: DecorationImage(image:AssetImage('asset/images/Thumbnail.png')))
                                                    
                                                          ,
                                                    ),
                                                  ),
                                      ),
            ),
          ),
          trailing:getRecentPop(index: index)
        ),
      ),
    );
  }

  getList() {
    List<Recentlistingmode> objList = recentDB.values.toList();
    List<String> videoPath = [];
    for (Recentlistingmode obj in objList) {
      videoPath.add(obj.recentpath);
    }
    return videoPath;
  }
}
getRecentStatus({required String path}) {
  List<Recentlistingmode> recList = recentDB.values.toList();

  List<Recentlistingmode> result =
      recList.where((checking) => checking.recentpath == path).toList();

  if (result.isEmpty) {
    var recObj = Recentlistingmode(recentpath: path);
    recentDB.add(recObj);
  } else {
   boolrec = true;
  }
}
