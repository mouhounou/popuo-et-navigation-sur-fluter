import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_navigation/body.dart';

class HomePage extends StatelessWidget{

  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pop Up et Nav"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Body(),
    );
  }
}