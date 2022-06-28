import 'dart:developer';
import 'dart:io';
import 'package:broto_player/Fetching%20files/InnerFetching/video_with_info.dart';
import 'package:broto_player/Fetching%20files/searching_Files.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'load_folder_list.dart';

List<String> fetchedVideosPath = []; //all videos path loaded first time
ValueNotifier<List<String>> favVideos = ValueNotifier([]);

onSuccess(List<String> data) {
  fetchedVideosPath = data;
  // print("------------------------${fetchedVideosPath.length}-----------------------");
  for (int i = 0; i < fetchedVideosPath.length; i++) {
    if (fetchedVideosPath[i].startsWith('/storage/emulated/0/Android/data')) {
      fetchedVideosPath.remove(fetchedVideosPath[i]);
      i--;
    }
  }
   loadFolderList();
  getVideoWithInfo();

  log("------------------------${fetchedVideosPath.length}-----------------------");


}

//first called from splash screen

Future splashFetch() async {
  log('object');
  if (await _requestPermission(Permission.storage)) {
    SearchFilesInStorage.searchInStorage([
      '.mp4',
      '.mkv',
    ], onSuccess, (p0) {});
  } else {
    splashFetch();
  }
}

//request for the permission
Directory? dir;

Future<bool> _requestPermission(Permission permission) async {
  final store = Permission.storage;
  final access = Permission.accessMediaLocation;
  if (await permission.isGranted) {
    await access.isGranted && await access.isGranted;
    print(
        '=============================permission granted =======================');
    return true;
  } else {
    var result = await store.request();
    var oneresult = await access.request();
    print(
        '=============================permission request =======================');

    if (result == PermissionStatus.granted &&
        oneresult == PermissionStatus.granted) {
      print(
          '=============================permission status granted =======================');

      return true;
    } else {
      print(
          '=============================permission denied =======================');

      return false;
    }
  }
}
