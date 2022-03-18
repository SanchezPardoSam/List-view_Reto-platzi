import 'package:flutter/material.dart';
import 'package:list_view/contact.dart';
import 'package:list_view/contact_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<ContactInfo> _contacts = <ContactInfo>[];
  Future fetchContact() async {
    var contactList = <ContactInfo>[];

    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var contactsJson = json.decode(response.body);
      for (var contactJson in contactsJson) {
        contactList.add(ContactInfo.fromJson(contactJson));
      }
    }
    return contactList;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchContact().then((value) {
      setState(() {
        _contacts.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Contact(_contacts[index].name, _contacts[index].number,
            _contacts[index].email);
      },
      itemCount: _contacts.length,
    );
  }
}
