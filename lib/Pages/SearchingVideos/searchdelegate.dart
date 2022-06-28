import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';

import '../../Fetching files/InnerFetching/video_with_info.dart';
import '../../homescreen.dart';
import '../../videoplayer/widget/Project/allvideoplayer.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Homescreen())));
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? fetchedVideosWithInfo.value
        : fetchedVideosWithInfo.value
            .where((checking) =>
                checking.title!.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return Scaffold(
        backgroundColor: Colors.black,
        body: mylist.isEmpty
            ? Text("No matching found")
            : ListView.separated(
                padding: EdgeInsets.only(top: 10),
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(
                      
                    ),
                itemCount: mylist.length,
                
                itemBuilder: (context, index) {
                  // log(mylist.length.toString());
                  List<String> calling = getlist(mylist , index);
                  final VideoData video = mylist[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => AllvideoPlayer(urls: calling , index: index),
                      ),
                    ),
                    leading: Image.asset('asset/images/Thumbnail.png'),
                    title: Text(
                      video.title!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                  );
                },
              ));
  }
  getlist(List<VideoData> mylist ,  index  ) {
    List<String> videopath = [];
    for (VideoData obj in mylist) {
      videopath.add(obj.path!);
     
    }
     return videopath;
  }
}
