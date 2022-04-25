import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticateLoading) {
            if (kDebugMode) {
              print('Loading');
            }
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text('User is signed in!'),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Logout'),
                      onPressed: () async {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthSignOutRequested());
                      },
                    ),
                  )
                ]);
          }
        },
      ),
    );
  }
}
