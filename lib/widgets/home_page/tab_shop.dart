import 'package:flutter/material.dart';

class TabShop extends StatefulWidget {
  @override
  State createState() {
    return _TabShopState();
  }
}

class _TabShopState extends State<TabShop> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(children: <Widget>[
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
              Text('Tab Shop'),
            ],)
          ],
        ));
  }
}
