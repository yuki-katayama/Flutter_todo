import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget
{
  @override
  _TodoAddPage createState() => _TodoAddPage();
}

class _TodoAddPage extends State{
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト追加"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text,
                style: TextStyle(
                  color: Colors.blue,
                ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText:"やること",
                icon: Icon(Icons.today)
              ),
              onChanged: (String value) {
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _text = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                  onPressed: () async {
                    Navigator.of(context).pop(_text);
                  },
                  child: Text('リスト追加',
                      style: TextStyle(
                          color: Colors.white
                      )
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}