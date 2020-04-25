import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_commerce/models/product_model.dart';
import 'package:flutter_commerce/widgets/feature-product-list.dart';

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

    Widget _bannerSlide = Container(
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
//                      decoration: BoxDecoration(color: Colors.green),
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

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _bannerSlide,
        Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: FeatureProductList(
                  title: 'Sale',
                  description: 'Suprt summer sale',
                  viewAll: 'Xem tất cả',
                  products: products,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: FeatureProductList(title: 'New', products: products),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: FeatureProductList(
                    title: 'New',
                    description: 'You\'ve never seen it before!',
                    products: products),
              ),
            ],
          ),
        )
      ],
    );
  }
}
