import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:path_provider/path_provider.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Show Material Dialog'),
              onPressed: _showMaterialDialog,
            ),
            ElevatedButton(
              child: Text('Show Cupertino Dialog'),
              onPressed: showDevice,
            ),
            ElevatedButton(onPressed: createFile, child: Text("Create File"))
          ],
        ),
      ),
    );
  }

  createFile() async {
    var dir = await getExternalStorageDirectory();

    var fileName = "${dir!.path}/sample_${DateTime.now().day}.json";
    print("文件名:$fileName");
    var file = File(fileName);
    if (file.existsSync()) {
      print('文件已存在');
    } else {
      file.writeAsString("文本");
      print('文件已创建');
    }
  }

  showDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo android = await deviceInfo.androidInfo;
    print('Running on ${android.model}');
    print('Device display:${android.display}');
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    print('Device display:$height*$width');
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Cupertino Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
