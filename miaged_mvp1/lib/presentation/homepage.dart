import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Homepage'),
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Go to Dashboard'),
        onPressed: () {
          Navigator.of(context).pushNamed('/dashboard');
        },
      )),
    );
  }
}
