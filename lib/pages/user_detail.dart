import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserDetailPageState();
  }
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('User detail'),
      ),
    );
  }
}