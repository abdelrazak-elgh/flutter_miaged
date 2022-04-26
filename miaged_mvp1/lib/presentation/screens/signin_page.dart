import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthRepository repository = AuthRepository();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  late BuildContext dialogContext;

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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  dialogContext = context;
                  return Dialog(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          CircularProgressIndicator(
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }

          if (state is AuthInvalidLogin) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(dialogContext);
              // Showing the error message if the user has entered invalid credentials
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.credentialError)));
            });
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
                  label: const Text('Se connecter',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthSignInRequested(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        context));
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
                      text: 'Pas de compte ? ',
                    )),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthUserWantedRegister());
                      },
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              text: 'S\'enregistrer ')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 50,
                  thickness: 2,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      minimumSize: const Size.fromHeight(40),
                    ),
                    label: const Text('Continue as Guest',
                        style: TextStyle(fontSize: 20)),
                    icon: const Icon(Icons.arrow_back),
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
    );
  }
}
