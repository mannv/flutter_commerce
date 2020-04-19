import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _slideIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> listBanner = ['1.png', '2.png', '3.png', '4.jpg'];
    double bannerWidth = MediaQuery.of(context).size.width;

    final _dotPaginate = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listBanner.map((url) {
        int index = listBanner.indexOf(url);
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _slideIndex
                ? Theme.of(context).primaryColor
                : Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );

    final _bannerSlide = Container(
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                height: 196.0,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _slideIndex = index;
                  });
                }),
            items: listBanner
                .map(
                  (item) => Container(
                      decoration: BoxDecoration(color: Colors.green),
                      child: Image.asset(
                        'images/banners/${item}',
                        width: bannerWidth,
                        fit: BoxFit.fitWidth,
                      )),
                )
                .toList(),
          ),
          Positioned(
            bottom: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: _dotPaginate,
              ),
            ),
          ),
        ],
      ),
    );

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _bannerSlide,
                Column(
                  children: <Widget>[Text('vai hang')],
                )
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Shop'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text('Bag'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Favorites'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
              )
            ]));
  }
}
