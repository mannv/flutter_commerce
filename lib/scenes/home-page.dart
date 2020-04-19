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

  @override
  Widget build(BuildContext context) {
    List<String> listBanner = ['1.png', '2.png', '3.png', '4.jpg'];
    double bannerWidth = MediaQuery.of(context).size.width;
    final _bannerSlide = Container(
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listBanner.map((url) {
              int index = listBanner.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _slideIndex
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );

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
            )));
  }
}
