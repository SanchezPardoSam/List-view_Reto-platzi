import 'package:flutter/material.dart';
import 'package:list_view/contactList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: ContactList()
      ),
    );
  }
}
