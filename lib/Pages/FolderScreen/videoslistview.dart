import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../Fetching files/InnerFetching/load_folder_video.dart';
import '../../videoplayer/thumbnail.dart';
import '../../videoplayer/widget/Project/player.dart';
import '../../widgets/Drawer/drawer.dart';
import '../Add favou/video_tile_popup.dart';
//folder videos
class Videolistview extends StatefulWidget {
  Videolistview({Key? key, required this.folderpath}) : super(key: key);
  String folderpath;
  @override
  State<Videolistview> createState() => _VideolistviewState();
}

class _VideolistviewState extends State<Videolistview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFolderVideos(widget.folderpath);
  
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIDEOS'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ValueListenableBuilder(
            valueListenable: filteredFolderVideos,
            builder: (BuildContext ctx, List<dynamic> videoWithIndex,
                Widget? child) {
              return videoWithIndex.isEmpty
                  ? emptyDisplay("Videos")
                  : ListView.builder(
                      padding: EdgeInsets.all(_w / 30),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: videoWithIndex.length, 
                      //video Length.................
                      itemBuilder: (BuildContext context, int index) {
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
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) => CustomOrientationPlayer(
                                                urls:
                                                    videoWithIndex[index],
                                                index: index,
                                              ))),
                                  title: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          height: 50,
                                          child: Text(
                                            videoWithIndex[index]
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
                                        future:
                                            getThumbnail(videoWithIndex[index]),
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
                                  trailing: getPopup(path: videoWithIndex[index],context: context),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
            }),
      ),
    );
  }
}




