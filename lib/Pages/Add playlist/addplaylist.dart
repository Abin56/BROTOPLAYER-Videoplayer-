import 'package:flutter/material.dart';
import '../../../Database/datamode.dart';
import '../../../Pages/PlayList/update.dart';
import '../../../main.dart';

class PopPlaylistFolder extends StatelessWidget {
  PlaylistModel folderName;
  final String videoPath;
  int index;
  PopPlaylistFolder(
      {Key? key,
      required this.folderName,
      required this.videoPath,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
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
                  videoplaylistmode object = videoplaylistmode(
                      PLvideopath: videoPath, playfolderlistname: folderName.addplaylist);
                      videoPlaylistDB.add(object);
                      print(videoPlaylistDB.length);
                      Navigator.pop(context);
                     
                      ScaffoldMessenger.of(context).showSnackBar( getSnackBarTwo(context: context));
                      
                  // <><><><><><><><><><><><><>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
                    if (value == 'del') {
                      playistDB.deleteAt(index);
                    }
                    if (value == 'edit') {
                      geteditalert(context: context, index: index);
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
                            child: Row(
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
                      ])
            ]),
      ),
    );
  }
}
getSnackBarTwo({required context}){
  
  return   SnackBar(
    content: Text('Video added to Folder',style: TextStyle(color: Colors.green),),
    backgroundColor: Colors.white,
    action: SnackBarAction(label: 'Ok', onPressed: (){})


   

  );
  
}