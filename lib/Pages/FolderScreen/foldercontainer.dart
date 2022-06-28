import 'package:broto_player/Pages/FolderScreen/videoslistview.dart';
import 'package:flutter/material.dart';

import '../../Fetching files/InnerFetching/load_folder_list.dart';

class folder_container extends StatelessWidget {
  folder_container({Key? key, required this.index, required this.folderName})
      : super(key: key);
  int index;
  String folderName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 25, 25),
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Videolistview(
                                folderpath: folderName,
                              )));
                },
                child: const Icon(
                  Icons.folder,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                fetchedFolders.value[index].split('/').last,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 80,
              ),
            ]),
      ),
    );
  }
}
