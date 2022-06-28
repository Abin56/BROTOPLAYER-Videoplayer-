import 'package:flutter/material.dart';

import '../../main.dart';

Widget getFavRemove({required index}) {
  return PopupMenuButton(
    onSelected: (value) { 
     favvideoDB.deleteAt(index);
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
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                "Remove",
                style: TextStyle(color: Colors.white),
              )
              
            ],
          ))
    ],
  );
  
}
getPlaylistPop({index}){
    return PopupMenuButton(
    onSelected: (value) { 
     videoPlaylistDB.deleteAt(index);
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
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                "Remove",
                style: TextStyle(color: Colors.white),
              )
              
            ],
          ))
    ],
  );
}
getRecentPop({index}){
    return PopupMenuButton(
    onSelected: (value) { 
     recentDB.deleteAt(index);
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
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                "Remove",
                style: TextStyle(color: Colors.white),
              )
              
            ],
          ))
    ],
  );
}
getRecentAlldeltePop({index}){
    return PopupMenuButton(
    onSelected: (value) { 
     recentDB.deleteAll(index);
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
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                "Remove",
                style: TextStyle(color: Colors.white),
              )
              
            ],
          ))
    ],
  );
}