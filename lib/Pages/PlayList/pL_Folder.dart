// ignore_for_file: file_names

import 'package:broto_player/Pages/PlayList/update.dart';
import 'package:flutter/material.dart';

import '../../Database/datamode.dart';
import '../../main.dart';
import 'pL_videlist.dart';

// ignore: must_be_immutable
class PlaylistFolder extends StatelessWidget {
  PlaylistModel folderName;
  int index;
  PlaylistFolder({Key? key, required this.folderName, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 25, 25),
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PLvideolist(Playlistpath: folderName.addplaylist,)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        folderName.addplaylist,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              //Deleting folders in Playlist><><><><><><<><><>

              PopupMenuButton(
                  onSelected: (value) {
                    if(value=='del'){
                        playistDB.deleteAt(index);
                    }
                    if(value=='edit'){
                      geteditalert(context: context,index: index);
                    }
                 
            

                  },
                  
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.deepOrange,
                  ),
                  color: Colors.black,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 'del',
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                            PopupMenuItem(
                              value: 'edit',
                              child:Row(
                               children: const [
                                Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                              ))
                      ]
                      )
            ]),
      ),
    );
  }
}
// getPlaylistfoldeltePOP(){
//   return PopupMenuButton(itemBuilder: itemBuilder);

// }
