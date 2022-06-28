import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
 part 'datamode.g.dart';

@HiveType(typeId: 1)
class DbVideplayer {
 @HiveField(0)
  final String? videoPath;
  @HiveField(1)
  final String? videoName;
  @HiveField(2)
  final String folderPath;
  @HiveField(3)
  final String thumbnail;
  @HiveField(4)
  bool isFav;


  DbVideplayer({required this.videoPath,
  required this.videoName,
  required this.folderPath,
  required this.thumbnail,
  required this.isFav});
  
}
@HiveType(typeId:2)
class SecDataBase {
@HiveField(0)
 final String favVideo;
  
  SecDataBase({required this.favVideo});
}
@HiveType(typeId:3)

class PlaylistModel {
   @HiveField(0)
   final String addplaylist;

   PlaylistModel({required this.addplaylist});
}
@HiveType(typeId: 4)
class videoplaylistmode{
  @HiveField(0)
  String PLvideopath;
  @HiveField(1)
  String playfolderlistname;
  videoplaylistmode({required this.PLvideopath,required this.playfolderlistname});
  
}
@HiveType(typeId: 6)
class Recentlistingmode{
  @HiveField(0)
  final String recentpath;

  Recentlistingmode({required this.recentpath});
  
}
