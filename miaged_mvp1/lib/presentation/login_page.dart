import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthRepository repository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('User is currently signed out!')),
            Center(
              child: ElevatedButton(
                child: const Text('Sign in Anonymously'),
                onPressed: () async {
                  User? result = await repository.signInAnon();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(result!.uid.toString()),
                    duration: const Duration(seconds: 5),
                  ));
                },
              ),
            )
            //     child: ElevatedButton(
            //   child: const Text('Sign in Anonymously'),
            //   onPressed: () async {
            //     User? result = await repository.signInAnon();
            //     if (result == null) {
            //       if (kDebugMode) {
            //         print('error signing in');
            //       }
            //     } else {
            //       if (kDebugMode) {
            //         print('signed in as anonymous!');
            //       }
            //       if (kDebugMode) {
            //         print(result.uid);
            //       }
            //     }
            //     repository.signInAnon().then((value) => {
            //           // ignore: avoid_print
            //           Navigator.of(context).pushNamed('/dashboard')
            //         });
            //   },
            // )),
          ],
        ));
  }
}
