import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthRepository repository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
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
                children: [
                  const Center(child: Text('User is currently signed out!')),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Sign in Anonymously'),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthSignInRequested());
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text(result!.uid.toString()),
                        //   duration: const Duration(seconds: 5),
                        // ));
                      },
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}
