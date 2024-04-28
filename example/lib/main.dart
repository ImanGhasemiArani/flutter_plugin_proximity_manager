import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:proximity_manager/proximity_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ProximityManager.toggleProximityManager(true);
              },
              child: Text('Turn on proximity manager'),
            ),
            ElevatedButton(
              onPressed: () {
                ProximityManager.toggleProximityManager(false);
              },
              child: Text('Turn off proximity manager'),
            ),
          ],
        ),
      ),
    );
  }
}
