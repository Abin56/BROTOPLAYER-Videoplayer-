import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';
import '../../Database/datamode.dart';
import '../../main.dart';
import '../../main.dart';
import '../../videoplayer/thumbnail.dart';
import '../../videoplayer/widget/Project/allvideoplayer.dart';
import '../../widgets/Drawer/drawer.dart';
import 'remove_tile.dart';
bool boolfav = false;
var showsnackbar;

class Favirote extends StatelessWidget {
  const Favirote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: AnimationLimiter(
          child: ValueListenableBuilder(
              valueListenable: favvideoDB.listenable(),
              builder: (BuildContext context, Box<SecDataBase> favList,
                  Widget? child) {
                return favvideoDB.isEmpty
                    ? emptyDisplay("Videos")
                    : ListView.builder(
                        padding: EdgeInsets.all(_w / 30),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: favvideoDB.values.length, ///////
                        //video Length.................
                        ///
                        itemBuilder: (BuildContext context, int index) {
                          SecDataBase? video = favvideoDB.getAt(index);
    
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 2500),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: _w / 15),
                                  height: _w / 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
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
                                        List<String> result;
                                        result = getList(favList.values.toList());
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => AllvideoPlayer(
                                              urls: result,
                                              index: index,
                                            ),
                                          ),
                                        );
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              height: 200,
                                              child: Text(
                                                video!.favVideo
                                                    .toString()
                                                    .split('/')
                                                    .last,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
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
                                            future: getThumbnail(
                                                video.favVideo.toString()),
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
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'asset/images/Thumbnail.png'))),
                                                        ),
                                                      ),
                                          ),
                                        ),
                                      ),
                                      trailing: getFavRemove(index: index)),
                                ),
                              ),
                            ),
                          );
                        });
              }),
        ),
      ),
    );
  }

  getList(List<SecDataBase> objList) {
    List<String> videoPath = [];
    for (SecDataBase obj in objList) {
      videoPath.add(obj.favVideo);
    }
    return videoPath;
  }
}

getfavStatus({required path}) {
  List<SecDataBase> favList = favvideoDB.values.toList();

  List<SecDataBase> result =
      favList.where((checking) => checking.favVideo == path).toList();

  if (result.isEmpty) {
    var favobj = SecDataBase(favVideo: path);
    favvideoDB.add(favobj);
  } else {
    boolfav = true;
  }
}

getsnackbar({
  required context,
}) {
  if (boolfav == true) {
    showsnackbar = SnackBar(
        content: Text('Already added in favourites'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ));
  } else {
    showsnackbar = SnackBar(
        content: Text('Added'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ));
  }
  ScaffoldMessenger.of(context).showSnackBar(showsnackbar);
}
