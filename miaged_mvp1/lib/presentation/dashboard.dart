import 'package:flutter/material.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final AuthRepository repository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Dashboard'),
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text('User is signed in!'),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Logout'),
                onPressed: () {
                  repository.signOut();
                },
              ),
            )
          ]),
    );
  }
}
