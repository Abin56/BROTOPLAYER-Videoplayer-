import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import '../../Database/datamode.dart';
import '../../main.dart';
import 'fetch_video_data.dart';

final videoInfo = FlutterVideoInfo(); //creating object of infoclass
ValueNotifier<List<VideoData>> fetchedVideosWithInfo =
    ValueNotifier([]); //videos with info

Future getVideoWithInfo() async {
  videoDB.clear();
  List<DbVideplayer> modelList = [];
  DbVideplayer videoObj;
  fetchedVideosWithInfo.value.clear();
  for (int i = 0; i < fetchedVideosPath.length; i++) {
    VideoData? info = await videoInfo.getVideoInfo(fetchedVideosPath[i]);
    videoObj = DbVideplayer(
        videoPath: info!.path,
        videoName: info.title,
        folderPath: '',
        thumbnail: '',
        isFav: false);
    modelList.add(videoObj);
    fetchedVideosWithInfo.value.add(info);
  }
  videoDB.addAll(modelList);
  print(
      "======================${fetchedVideosWithInfo.value.length}================");
}
