import 'package:flutter/material.dart';
import 'package:flutter_0315/main.dart';
import 'package:flutter_0315/pertemuan1.dart';
import 'package:flutter_0315/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMatakuliah extends StatefulWidget {
  const DashboardMatakuliah({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DashboardMatakuliah> createState() => _DashboardMatakuliah();
}

class _DashboardMatakuliah extends State<DashboardMatakuliah> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add)
              ),
            ]
        ),
        body: Container(
            child: GestureDetector(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text("Senin"),
                      subtitle: Text("Aplikasi Berbasis Dekstop"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: '0'
                          ),
                          new PopupMenuItem<String>(
                              child: const Text('Delete'), value: '1'
                          ),
                        ],
                      ),
                      /*
              onTap: (){
                showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("Edit")
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("Delete")
                          )
                        ],
                      ),
                  );
                });
              },*/
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}