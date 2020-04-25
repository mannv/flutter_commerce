import 'package:flutter_commerce/models/product_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeatureProductItem extends StatefulWidget {
  Product product;

  FeatureProductItem({this.product}) : super();

  @override
  State createState() {
    return _FeatureProductItemState();
  }
}

class _FeatureProductItemState extends State<FeatureProductItem> {
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

    final oCcy = new NumberFormat("#,###", "en_US");

    return GestureDetector(
      onTap: () {
        print('goto product detail');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        height: 290.0,
        width: 150.0,
//      decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 290,
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
                      Column(
                        children: <Widget>[
                          Text(
                            '${oCcy.format(widget.product.price)}${widget.product.priceUnit}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Comfortaa-Bold'),
                          ),
                          Visibility(
                            visible: widget.product.oldPrice > 0,
                            child: Text(
                                '${oCcy.format(widget.product.oldPrice)}${widget.product.priceUnit}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.lineThrough)),
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
