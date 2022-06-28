import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../Database/datamode.dart';
import '../../main.dart';
import '../../widgets/Drawer/drawer.dart';
import 'pL_Folder.dart';
bool boolplaylist = false;
var showdilog;

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Add  playlist here ->',
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
              isRepeatingAnimation: false,
              repeatForever: false,
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),
            const SizedBox(
              width: 40,
            ),
            TextButton.icon(
              onPressed: () {
                getBotttomsheet(context);
              },
              icon: const Icon(
                Icons.my_library_add,
                color: Colors.green,
              ),
              label: const Text(
                'Playlist',
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: playistDB.listenable(),
            builder: (BuildContext context, Box<PlaylistModel> listenPlaylist,
                    Widget? child) =>
                playistDB.isEmpty
                    ? emptyDisplay("videos")
                    : ListView.builder(
                        itemCount: playistDB.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          PlaylistModel? playlistobj = playistDB.getAt(index);
                          return PlaylistFolder(
                            folderName: playlistobj!,
                            index: index,
                          );
                        }),
          ),
        )
      ],
    ));
  }

  getBotttomsheet(context) {
    GlobalKey<FormState> formkey = GlobalKey();

    final playlistcontroller = TextEditingController();
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Form(
            key: formkey,
            child: Container(
              height: 500,
              width: double.infinity,
              color: const Color.fromARGB(232, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Add to Playlist",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: playlistcontroller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name of folder',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Folder name is empty';
                      } else if (getplaylistsatus(playlistpath: value)) {
                        return 'Already exist';
                      }
                    },
                  ),
                  SizedBox(height: 200),
                  SizedBox(
                    width: 151,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            PlaylistModel objplaylist = PlaylistModel(
                                addplaylist: playlistcontroller.text);
                            playistDB.add(objplaylist);

                            Navigator.pop(context);
                          }

                          // if (playlistcontroller.text.isNotEmpty) {

                          // } else {
                          //   print("Please enter value");
                          // }
                          print(playistDB.values.length);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add),
                            const Text("Create Folder")
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

getplaylistsatus({required playlistpath}) {
  List<PlaylistModel> textplaylist = playistDB.values.toList();
  List<PlaylistModel> result = textplaylist
      .where((checking) => checking.addplaylist == playlistpath)
      .toList();
  if (result.isEmpty) {
    return false;
  } else {
    return true;
  }
}
