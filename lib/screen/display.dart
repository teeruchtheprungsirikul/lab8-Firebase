// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รายงานการวัดอุณหภูมิ')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
              children: snapshot.data!.docs.map((document) {
              
            return Container(
              child: ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(child: Text(document['temp']))
                ),
                title: Text(document['fname'] + ' ' + document['lname']),
                subtitle: Text(document['email']),
              ),
            );
          }).toList());
        },
      ),
    );
  }
}
