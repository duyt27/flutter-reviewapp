import 'package:flutter/material.dart';
import 'product_edit.dart';
import 'product_list.dart';
import 'package:project_app/scoped-model/main.dart';

class ProductsAdminPage extends StatelessWidget {
  final MainModel model;

  ProductsAdminPage(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Products'),
        ),
        body: ProductListPage(model));
  }
}
