import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:project_app/pages/product_edit.dart';
import 'package:project_app/pages/product_list.dart';
import 'package:project_app/pages/user_detail.dart';
import 'package:project_app/pages/notifications.dart';
import 'package:project_app/pages/products_home.dart';
import 'package:project_app/pages/products_admin.dart';

import 'package:project_app/scoped-model/main.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState(model);
  }
}

class _ProductsPageState extends State<ProductsPage> {
  int _selectedIndex = 0;
  String _title;

  @override
  void initState() {
    super.initState();
    _title = 'FigView';
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'FigView';
          }
          break;
        case 1:
          {
            _title = 'Review của bạn';
          }
          break;
        case 2:
          {
            _title = 'Tạo review';
          }
          break;
        case 3:
          {
            _title = 'Thông báo';
          }
          break;
        case 4:
          {
            _title = 'Trang cá nhân';
          }
          break;
      }
    });
  }

  final MainModel model;

  _ProductsPageState(this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      ProductsHomePage(model),
      ProductListPage(model),
      ProductEditPage(),
      NotificationsPage(),
      UserDetailPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 25.0),
        ),
        actions: [
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: screen[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Reviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
(index) {
switch(index){
case 0: Navigator.pushReplacementNamed(context, '/products_home');
break;
case 1: Navigator.pushReplacementNamed(context, '/list');
break;
case 2: Navigator.pushReplacementNamed(context, '/edit');
break;
case 3: Navigator.pushReplacementNamed(context, '/notification');
break;
case 4: Navigator.pushReplacementNamed(context, '/profile');
break;
}
}*/
