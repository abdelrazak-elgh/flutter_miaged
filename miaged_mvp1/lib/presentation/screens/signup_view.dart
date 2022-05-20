import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/authentication_repository.dart';
import 'package:miaged_mvp1/presentation/widget/dialog_loading.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final AuthenticationRepository repository = AuthenticationRepository();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late BuildContext dialogContext;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Disabling Android System Back Button
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueAccent,
          ),
          body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthenticationLoading) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        dialogContext = context;
                        return const DialogLoading();
                      });
                }

                if (state is AuthenticationSuccess) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homeapp', (Route<dynamic> route) => false);
                }

                // if (state is AuthenticationFailure) {
                //   Future.delayed(const Duration(seconds: 2), () {
                //     Navigator.pop(dialogContext);
                //     // Showing the error message if the user has entered invalid credentials
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(content: Text('Login error')));
                //   });
                // }
              },
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _emailController,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _confirmPasswordController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent,
                              minimumSize: const Size.fromHeight(50)),
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('S\'enregister',
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Email et mot de passe ne peuvent être vide')));
                              return;
                            }

                            if (_passwordController.text.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Votre mot de passe doit contenir au moins 6 caractères')));
                              return;
                            }

                            if (_confirmPasswordController.text.isEmpty ||
                                _confirmPasswordController.text !=
                                    _passwordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Les mots de passe ne correspondent pas')));
                              return;
                            }

                            BlocProvider.of<AuthBloc>(context).add(
                                AuthSignUpRequested(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: 'Vous avez déjà un compte ? ',
                            )),
                            InkWell(
                              onTap: () {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context)
                                      .popAndPushNamed('/signin');
                                } else {
                                  Navigator.of(context).pushNamed('/signin');
                                }
                              },
                              child: RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 99, 51),
                                          decoration: TextDecoration.underline),
                                      text: 'Se connecter ')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
