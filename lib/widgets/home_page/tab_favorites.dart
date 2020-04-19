import 'package:flutter/material.dart';

class TabFavorites extends StatefulWidget {
  @override
  State createState() {
    return _TabFavoritesState();
  }
}

class _TabFavoritesState extends State<TabFavorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
                Text('Tab Favorites'),
              ],
            )
          ],
        ));
  }
}
