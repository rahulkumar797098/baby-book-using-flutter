import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HindiBookScreen extends StatefulWidget {
  const HindiBookScreen({super.key});

  @override
  State<HindiBookScreen> createState() => _HindiBookScreenState();
}

class _HindiBookScreenState extends State<HindiBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("हिंदी किताब"),),
    body: Container(),
    );

  }
}
