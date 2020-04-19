import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TabHome extends StatefulWidget {
  @override
  State createState() {
    return _TabHomeState();
  }
}

class _TabHomeState extends State<TabHome> {
  int _slideIndex = 0;

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
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _slideIndex = index;
                  });
                }),
            items: listBanner
                .map(
                  (item) => Container(
                      decoration: BoxDecoration(color: Colors.green),
                      child: Image.asset('images/banners/${item}',
                          width: bannerWidth, fit: BoxFit.fitWidth)),
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

    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _bannerSlide,
            Column(
              children: <Widget>[
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                Text('vai hang'),
                SizedBox(height: 40.0),
              ],
            )
          ],
        ));
//    return Container(
//      padding: EdgeInsets.only(top: 100.0),
//      child: Text('Home Tab'),
//    );
  }
}
