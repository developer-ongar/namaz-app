import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бағдарлама  туралы'),
      ),
      body: Container(
        child: Center(
          child: Text('Сұрақтар жақын арада қос'),
        ),
      ),
    );
  }
}
