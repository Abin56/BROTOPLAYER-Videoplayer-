import 'package:broto_player/Database/datamode.dart';
import 'package:broto_player/Fetching%20files/InnerFetching/fetch_video_data.dart';
import 'package:broto_player/main.dart';
import 'package:broto_player/videoplayer/widget/Project/allvideoplayer.dart';
import 'package:broto_player/widgets/Drawer/drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Fetching files/InnerFetching/load_folder_list.dart';
import 'ListofNavigator/list.dart';
import 'Pages/FolderScreen/foldercontainer.dart';
import 'Pages/PlayList/Playlist.dart';
import 'Pages/all_videos/allvideos.dart';
import 'Pages/Add favou/favourites.dart';
import 'Pages/Recent/recent.dart';
import 'Pages/SearchingVideos/searchdelegate.dart';

// import 'package:flutter_gradients/flutter_gradients.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;
  @override
  void initState() {
    splashFetch();
    super.initState();
  }
DateTime timeBackPressed = DateTime.now();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.transparent,
          height: 70.h,
          items: items,
          index: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () =>
                
                    showSearch(context: (context), delegate: Search()),
                icon: const Icon(Icons.search)),
            // PopupMenuButton(
            //     color: Colors.black,
            //     itemBuilder: ((context) => [
            //           PopupMenuItem(
            //               child: Row(
            //             children: [
            //               IconButton(
            //                   onPressed: () {
            //                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomOrientationPlayer()));
            //                   },
            //                   icon: const Icon(Icons.exit_to_app)),
            //               const Text(
            //                 "EXITzz",
            //                 style: TextStyle(
            //                     color: Colors.amber,
            //                     fontWeight: FontWeight.bold),
            //               )
            //             ],
            //           ))
            //         ]))
          ],
          title: Text(screenTitile[currentIndex]),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(70),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 237, 142, 0),
                Color.fromARGB(255, 255, 102, 0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
        ),
        body: screen[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (recentDB.values.isEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AllvideoPlayer(urls: fetchedVideosPath);
              }));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AllvideoPlayer(
                  urls: getList(),
                  index: recentDB.values.length - 1,
                );
              }));
            }
          },
          child: const Icon(Icons.play_arrow),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 39, 29, 41),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //

}

List screen = const [
  HomeScreens(),
  Allvideos(),
  RecentPage(),
  Favirote(),
  PlayList()
];
List screenTitile = const [
  "Folders",
  "All videos",
  "Recent List",
  "Favourites List",
  "Play List"
];

class HomeScreens extends StatelessWidget {
  const HomeScreens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setSeenonBoard();

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'BROTO  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      ' PLAYER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: fetchedFolders,
                    builder:
                        (BuildContext context, dynamic folderlist, Widget) {
                      // log(folderlist.length.toString());
                      return ListView.separated(
                          shrinkWrap: true,
                          controller: ScrollController(),
                          itemBuilder: (context, index) => folder_container(
                              index: index,
                              folderName: folderlist[
                                  index]), //Folder desgin...............................
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: folderlist.length);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////////
  Future setSeenonBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenonboard = await prefs.setBool('seenonboard', true);
    print(seenonboard);
  }

////////////////////////////////////////////////////////////
}

getList() {
  List<Recentlistingmode> objList = recentDB.values.toList();
  List<String> videoPath = [];
  for (Recentlistingmode obj in objList) {
    videoPath.add(obj.recentpath);
  }
  return videoPath;
}
