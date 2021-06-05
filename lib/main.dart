import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';

import 'package:project_app/pages/products.dart';
import 'package:project_app/pages/notifications.dart';
import 'package:project_app/pages/products_home.dart';
import 'package:project_app/pages/product_list.dart';
import 'package:project_app/pages/product_edit.dart';
import 'package:project_app/pages/user_detail.dart';
import 'package:project_app/pages/auth.dart';
import 'package:project_app/pages/product.dart';

import 'package:project_app/models/product.dart';

import 'package:project_app/scoped-model/main.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),

      //home: ProductsPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(model),
        '/products_home': (BuildContext context) => ProductsHomePage(model),
        '/list': (BuildContext context) => ProductListPage(model),
        '/edit': (BuildContext context) => ProductEditPage(),
        '/notification': (BuildContext context) => NotificationsPage(),
        '/profile': (BuildContext context) => UserDetailPage(),
      },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product = model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  ProductPage(product),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(model));
        },
    ),);
  }
}

