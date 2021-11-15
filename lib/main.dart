import 'package:flutter/material.dart';
import 'package:flutter_0315/pertemuan1.dart';
import 'package:flutter_0315/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page 72190315'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? isLogin = pref.getInt("is_Login");
    if(isLogin == 1){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pertemuan2(title: "Dashboard",)),
      );
    }
  }


  @override
  void initState(){
    navigateLogin();
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text(
                  'Pindah Halaman'
              ),
                onPressed:() async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login",0);
                Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Pertemuan1(title: "Halo Push",)),
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
