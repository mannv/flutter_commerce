import 'package:flutter/material.dart';

class TabProfile extends StatefulWidget {
  @override
  State createState() {
    return _TabProfileState();
  }
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
                Text('Tab Profile'),
              ],
            )
          ],
        ));
  }
}
