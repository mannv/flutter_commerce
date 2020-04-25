import 'package:flutter_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce/widgets/feature-product-item.dart';

class FeatureProductList extends StatefulWidget {
  String title;
  String viewAll;
  String description;
  List<Product> products;

  FeatureProductList({this.title, this.description = '', this.viewAll = 'View all', this.products})
      : super();

  @override
  State createState() {
    return _FeatureProductListState();
  }
}

class _FeatureProductListState extends State<FeatureProductList> {
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
                      child: Text(widget.viewAll),
                    )
                  ],
                ),
                Visibility(
                  visible: widget.description != '',
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      widget.description,
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          Container(
            height: 290.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  children: widget.products.map((prod) {
                    return FeatureProductItem(product: prod);
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
