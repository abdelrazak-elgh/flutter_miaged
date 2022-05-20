import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/authentication_repository.dart';
import 'package:miaged_mvp1/presentation/widget/dialog_loading.dart';
import 'package:miaged_mvp1/presentation/widget/divider_text.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final AuthenticationRepository repository = AuthenticationRepository();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late BuildContext dialogContext;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          title: const Text('Sign In'),
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
            //     ScaffoldMessenger.of(context)
            //         .showSnackBar(const SnackBar(content: Text('Login error')));
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
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        primary: Colors.greenAccent,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      icon: const Icon(Icons.lock_open, size: 32),
                      label: const Text('Se connecter',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () async {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Email et mot de passe ne peuvent être vide')));
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(
                            AuthSignInRequested(_emailController.text.trim(),
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
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          text: 'Pas de compte ? ',
                        )),
                        InkWell(
                          onTap: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).popAndPushNamed('/signup');
                            } else {
                              Navigator.of(context).pushNamed('/signup');
                            }
                          },
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                                  text: 'S\'enregistrer ')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DividerWithText(text: 'OU'),
                    const SizedBox(
                      height: 10,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          primary: const Color(0xffef5354),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        label: const Text('Continuer en tant que invité',
                            style: TextStyle(fontSize: 20)),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthSignInAnonRequested());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
