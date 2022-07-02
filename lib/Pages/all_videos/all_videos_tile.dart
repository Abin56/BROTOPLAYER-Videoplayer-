import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';
import '../../Database/datamode.dart';
import '../../Fetching files/InnerFetching/fetch_video_data.dart';
import '../../main.dart';
import '../../videoplayer/widget/Project/allvideoplayer.dart';
import '../../widgets/Drawer/drawer.dart';
import '../Add favou/video_tile_popup.dart';

class AllVideoTile extends StatefulWidget {
  AllVideoTile({Key? key}) : super(key: key);
  @override
  State<AllVideoTile> createState() => _AllVideoTileState();
}

class _AllVideoTileState extends State<AllVideoTile> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ValueListenableBuilder(
            valueListenable: videoDB.listenable(),
            builder: (ctx, Box<DbVideplayer> videoList, Widget? child) {
              return videoList.isEmpty
                  ? emptyDisplay("Videos")
                  : ListView.builder(
                      padding: EdgeInsets.all(_w / 30),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: videoList.values.length, ///////
                      //video Length.................
                      ///
                      itemBuilder: (BuildContext context, int index) {
                        DbVideplayer? video = videoDB.getAt(index);

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
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllvideoPlayer(
                                                  urls: fetchedVideosPath,
                                                  index: index,
                                                ))),
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
                                              video!.videoName.toString(),
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
                                      padding: const EdgeInsets.only(top: 5),
                                      child: SizedBox(
                                          height: 200,
                                          width: 90,
                                          child: Center(
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'asset/images/new.jpeg'))),
                                            ),
                                          )),
                                    ),
                                    trailing: getPopup(
                                        path: video.videoPath,
                                        context: context)),
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
