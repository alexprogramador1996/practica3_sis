import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getTests() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("tbtest");
    QuerySnapshot tests = await collectionReference.get();
    if (tests.docs.length != 0) {
      for (var doc in tests.docs) {
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getTests();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
