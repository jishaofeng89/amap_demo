import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class MapDemo extends StatefulWidget {
  MapDemo({Key key}) : super(key: key);

  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {

  Future<bool> requestPermission() async {
    final permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);

    if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
      return true;
    } else {
      Fluttertoast.showToast(msg: '动哒需要定位权限哟!');
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  AmapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('amap demo'),
      ),
      body: Container(
        child: AmapView(
          showZoomControl: false,
          zoomLevel: 18,
          maskDelay: Duration(milliseconds: 2000),
          onMapCreated: (controller) async {
            _controller = controller;
            if(await requestPermission()){
              print('授权成功');
              await _controller?.showMyLocation(
                true,
                myLocationType: MyLocationType.Follow
              );
            }
          },
        ),
      ),
    );
  }
}