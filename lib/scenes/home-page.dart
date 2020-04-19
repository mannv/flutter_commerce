import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce/widgets/home_page/tab_bag.dart';
import 'package:flutter_commerce/widgets/home_page/tab_favorites.dart';
import 'package:flutter_commerce/widgets/home_page/tab_home.dart';
import 'package:flutter_commerce/widgets/home_page/tab_profile.dart';
import 'package:flutter_commerce/widgets/home_page/tab_shop.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndexTab = 0;

  List<Widget> _widgetOptions = <Widget>[
    TabHome(),
    TabShop(),
    TabBag(),
    TabFavorites(),
    TabProfile()
  ];

  @override
  Widget build(BuildContext context) {
    Widget _footerNavigatorItem(int index, String label, String icon) {
      String iconName = index == _currentIndexTab
          ? '${icon}_activated.png'
          : '${icon}_inactive.png';

      TextStyle textActivated = Theme.of(context)
          .textTheme
          .overline
          .copyWith(color: Color(0xFFDB3022));
      TextStyle textInactive = Theme.of(context).textTheme.overline;

      return GestureDetector(
        onTap: () {
          setState(() {
            _currentIndexTab = index;
          });
        },
        child: Container(
          width: (MediaQuery.of(context).size.width - 32.0) / 5.0,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset(
                    'images/icons/bottom_nagivator_bar/${iconName}'),
              ),
              Text(label,
                  style:
                      index == _currentIndexTab ? textActivated : textInactive)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _widgetOptions[_currentIndexTab],
            ),
            Container(
              height: 83.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _footerNavigatorItem(0, 'Home', 'home'),
                  _footerNavigatorItem(1, 'Shop', 'shop'),
                  _footerNavigatorItem(2, 'Bag', 'bag'),
                  _footerNavigatorItem(3, 'Favorites', 'heart'),
                  _footerNavigatorItem(4, 'Profile', 'profile'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
