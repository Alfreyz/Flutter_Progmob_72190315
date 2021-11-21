import 'package:flutter/material.dart';
import 'package:flutter_0315/main.dart';
import 'package:flutter_0315/pertemuan1.dart';
import 'package:flutter_0315/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDosen extends StatefulWidget {
  const DashboardDosen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DashboardDosen> createState() => _DashboardDosen();
}

class _DashboardDosen extends State<DashboardDosen> {
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
              leading: Icon(Icons.person),
              title: Text("Jong Jek Siang"),
              subtitle: Text("0523515661 - jjs@staff.ukdw.ac.id"),
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