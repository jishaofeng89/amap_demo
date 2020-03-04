import 'package:flutter/material.dart';

class MapDemo extends StatefulWidget {
  MapDemo({Key key}) : super(key: key);

  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('amap demo'),
      ),
      body: Center(
        child: Text('yy'),
      ),
    );
  }
}