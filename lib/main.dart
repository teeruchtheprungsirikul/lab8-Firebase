import 'package:flutter/material.dart';
import 'package:my_nextflow_app/screen/display.dart';
import 'package:my_nextflow_app/screen/formscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: [FormScreen(),DisplayScreen()]),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: 'บันทึกอุณหภูมิ'),
            Tab(text: 'รายชื่อนักเรียน'),
          ],
        ),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
