import 'package:flutter/material.dart';
import 'package:flutter_0315/dashboard.dart';
import 'package:flutter_0315/main.dart';
import 'package:flutter_0315/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "contoh: Ferry",
                labelText: "Nama",
                icon: Icon(Icons.assignment_ind),
                border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (value){
                if (value!.isEmpty){
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              onPressed: (){
                  if (_formKey.currentState!.validate()){}
              },
            ),
            ElevatedButton(
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login",0);
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Dashboard(title: "Halo Push",)),
                );
              },
            ),
            ElevatedButton(
              onPressed: (){

            }, child: const Text(
              "Test Elevated Button"
            ),
              onLongPress: (){
              showDialog<String>(
              context: context, 
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlerDialog Tittle'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                TextButton(onPressed: () => Navigator.pop(context, 'cancel'),
    child: const Text('Cancel'),
    ),
    TextButton(onPressed: () => Navigator.pop(context, 'OK'),
    child: const Text('OK'),
    ),
              ],
                ),
              );
              },
            ),
          ],
          ),
        ),
      ),
    );

  }
  @override
  void initState() {

  }

}
