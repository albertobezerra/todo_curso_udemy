import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tent.1 TodoLocal'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Colors.amberAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Colors.amberAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Digita logo, antes que esqueça!',
                      labelStyle: TextStyle(
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  color: Colors.amberAccent,
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String?> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }

    //os tres futures acima são a estrutura base para o banco de dados. Um cria o arquivo, um salva e um ler!
  }
}
