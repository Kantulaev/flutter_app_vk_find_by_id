import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text;
  final _textEditingController = TextEditingController();

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(
      url: "https://vk.com/${_textEditingController.text}",
      androidToolbarColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter tour Id',
                  ),
                  controller: _textEditingController,
                ),
                Container(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => openBrowserTab(),
                    child: new Text('Open Your VK profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
