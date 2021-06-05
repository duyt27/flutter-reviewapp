import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:project_app/widgets/products/products.dart';
import 'package:project_app/scoped-model/main.dart';

class ProductsHomePage extends StatefulWidget {
  final MainModel model;

  ProductsHomePage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _ProductsHomePageState();
  }
}

class _ProductsHomePageState extends State<ProductsHomePage> {
  @override
  initState() {
    widget.model.fetchProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No products found!'));
      if (model.displayedProducts.length > 0 && !model.isLoading) {
        content = Products();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(onRefresh: model.fetchProducts,child: content,);
    },);
  }
}