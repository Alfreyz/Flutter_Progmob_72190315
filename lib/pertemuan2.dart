import 'package:flutter/material.dart';
import 'package:flutter_0315/main.dart';
import 'package:flutter_0315/pertemuan1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan2 extends StatefulWidget {
  const Pertemuan2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Pertemuan2> createState() => _Pertemuan2State();
}

class _Pertemuan2State extends State<Pertemuan2> {
  final _formKey = GlobalKey<FormState>();
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
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              ':',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text(
                  'Login'
              ),
              onPressed:() async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login",2);
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "Halo Push",)),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


  @override
  void initState() {

  }
