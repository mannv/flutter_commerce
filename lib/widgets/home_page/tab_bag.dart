import 'package:flutter/material.dart';

class TabBag extends StatefulWidget {
  @override
  State createState() {
    return _TabBagState();
  }
}

class _TabBagState extends State<TabBag> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
                Text('Tab Bag'),
              ],
            )
          ],
        ));
  }
}
