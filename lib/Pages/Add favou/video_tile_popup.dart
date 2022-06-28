import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../Database/datamode.dart';
import '../../main.dart';
import '../../widgets/Drawer/drawer.dart';
import '../Add playlist/addplaylist.dart';
import '../PlayList/Playlist.dart';
import 'favourites.dart';

Widget getPopup({required path, required context}) {
  return PopupMenuButton(
    onSelected: (value) {
      if (value == 'Fav') {
        getfavStatus(path: path);
        getsnackbar(context: context);
      }
      if (value == 'Play') {
        return getPLopupaddvideos(context: context, path: path);
      }
    },
    icon: const Icon(
      Icons.more_vert,
      color: Colors.orange,
    ),
    color: Colors.black,
    itemBuilder: (context) => [
      PopupMenuItem(
          value: 'Fav',
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(
                "Add to favourites",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
      PopupMenuItem(
          value: 'Play',
          child: Row(
            children: const [
              
              Icon(
                Icons.add,
                color: Colors.green,
              ),
              Text(
                "Add to Playlist",
                style: TextStyle(color: Colors.green),
              )
            ],
          ))
    ],
  );
}

getPLopupaddvideos({required context, required path}) {
  GlobalKey<FormState> formkey = GlobalKey();
  final controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (ctx1) {
        return Form(
          key: formkey,
          child: AlertDialog(
            title: Text("Add videos to Playlist"),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Invalid the Folder name is empty!";
                      } else if (getplaylistsatus(playlistpath: value)) {
                        return "Already exist";
                      }
                    },
                  ),
                  TextButton.icon(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          PlaylistModel objplaylist =
                              PlaylistModel(addplaylist: controller.text);
                          playistDB.add(objplaylist);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBarOne(context: context));
                          log("Added");
                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add")),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: ValueListenableBuilder(
                        valueListenable: playistDB.listenable(),
                        builder: (BuildContext context,
                                Box<PlaylistModel> listenplaylist,
                                Widget? child) =>
                            playistDB.isEmpty
                                ? emptyDisplay("Videos")
                                : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: playistDB.values.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    PlaylistModel? playlistobj =
                                        playistDB.getAt(index);
                                    return PopPlaylistFolder(
                                      folderName: playlistobj!,
                                      index: index,
                                      videoPath: path,
                                    );
                                  },
                                ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

getSnackBarOne({required context}) {
  return SnackBar(
      content: Text(
        'Folder Added',
        style: TextStyle(color: Colors.green),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(label: 'Ok', onPressed: () {}));
}
