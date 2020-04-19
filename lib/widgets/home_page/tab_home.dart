import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_commerce/models/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                child: FeatureProduction(
                    title: 'Sale', description: 'Suprt summer sale'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: FeatureProduction(
                    title: 'New', description: 'You\'ve never seen it before!'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: FeatureProduction(
                    title: 'New', description: 'You\'ve never seen it before!'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FeatureProduction extends StatefulWidget {
  String title;
  String description;

  FeatureProduction({this.title, this.description}) : super();

  @override
  State createState() {
    return _FeatureProduction();
  }
}

class _FeatureProduction extends State<FeatureProduction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('View all sale product');
                      },
                      child: Text('View all'),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    widget.description,
                    style: Theme.of(context).textTheme.overline,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          Container(
            height: 270.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  children: products.map((prod) {
                    return _ProductionItem(product: prod);
                  }).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProductionItem extends StatefulWidget {
  Product product;

  _ProductionItem({this.product}) : super();

  @override
  State createState() {
    return _ProductionItemState();
  }
}

class _ProductionItemState extends State<_ProductionItem> {
  @override
  Widget build(BuildContext context) {
    Widget discountInfo = Visibility(
        visible: widget.product.discount > 0,
        child: Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 24.0,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(29.0)),
            child: Center(
              child: Text(
                '- ${widget.product.discount}%',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ));

    Widget saveToFavorite = Positioned(
      bottom: 66.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () {
          print('save to favorite');
        },
        child: Container(
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
          child: Icon(
            Icons.favorite_border,
            size: 20.0,
            color: Color(0xFF9B9B9B),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        print('goto product detail');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        height: 270.0,
        width: 150.0,
//      decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        height: 185.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                              'images/product/${widget.product.image}',
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          RatingBarIndicator(
                            rating: widget.product.avgStar,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 14.0,
                            direction: Axis.horizontal,
                          ),
                          Text(
                            ' (${widget.product.totalRate})',
                            style: Theme.of(context).textTheme.overline,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(widget.product.category,
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                .copyWith(fontSize: 13.0)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(fontSize: 15.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Visibility(
                            visible: widget.product.oldPrice > 0,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(
                                  '${widget.product.oldPrice}${widget.product.priceUnit}',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey[600],
                                      decoration: TextDecoration.lineThrough)),
                            ),
                          ),
                          Text(
                            '${widget.product.price}${widget.product.priceUnit}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Comfortaa-Bold'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                discountInfo,
                saveToFavorite,
              ],
            )
          ],
        ),
      ),
    );
  }
}
