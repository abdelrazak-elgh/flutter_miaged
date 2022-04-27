import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/data_providers/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final AuthRepository repository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            child: Text('Dashboard'),
            alignment: Alignment.center,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Email → ${user?.email}',
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                user?.displayName != null
                    ? Text("Name → ${user?.displayName}")
                    : Container(),
                user?.uid != null ? Text("UID → ${user?.uid}") : Container(),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () async {
                      BlocProvider.of<AuthBloc>(context)
                          .add(AuthSignOutRequested());
                    },
                  ),
                )
              ]),
        ));
  }
}
