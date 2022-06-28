import 'package:flutter/material.dart';

import '../../Database/datamode.dart';
import '../../main.dart';
geteditalert({required context ,required index}) {
  final controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (ctx1) {
        return AlertDialog(
          title: Text('Edit'),
          content: TextFormField(
            controller:controller ,

          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                    label: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton.icon(
                    onPressed: () {
                     PlaylistModel objcontoller = PlaylistModel(addplaylist: controller.text);
                        playistDB.putAt(index, objcontoller);
                        Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.thumb_up_rounded,
                      color: Colors.green,
                    ),
                    label: const Text(
                      "Update",
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            )
          ],
        );
      });
}
