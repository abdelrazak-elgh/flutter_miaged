import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthRepository repository = AuthRepository();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Miaged'),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
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
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          minimumSize: const Size.fromHeight(40)),
                      icon: const Icon(Icons.lock_open),
                      label:
                          const Text('Sign in', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                            AuthSignInRequested(emailController.text.trim(),
                                passwordController.text.trim()));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 50,
                      thickness: 2,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      child: const Text('Continue as Guest',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthSignInAnonRequested());
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text(result!.uid.toString()),
                        //   duration: const Duration(seconds: 5),
                        // ));
                      },
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
