import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Contact extends StatefulWidget {
  String name;
  String number;
  String email;

  Contact(this.name, this.number, this.email, {Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Icon icon = const Icon(
    Icons.mail,
    color: Colors.white,
  );
  MaterialColor color = Colors.red;
  bool validation = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                offset: Offset(0, 3),
                blurRadius: 7,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: CircleAvatar(
                child: Text(
                  widget.name[0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80, left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    widget.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: color,
                ),
                child: InkWell(
                  child: icon,
                  onTap: () {
                    setState(() {
                      if (validation == true) {
                        color = Colors.grey;
                        validation = false;
                        icon = const Icon(
                          Icons.mail,
                          color: Colors.black87,
                        );
                      } else {
                        color = Colors.red;
                        validation = true;
                        icon = const Icon(
                          Icons.mail,
                          color: Colors.white,
                        );
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
