import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Main page')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            if (kDebugMode) {
              print('is auth');
            }
            Navigator.of(context).pushNamed('/dashboard');
          }
          if (state is UnAuthenticated) {
            if (kDebugMode) {
              print('is not auth');
            }
            Navigator.of(context).pushNamed('/login');
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: const Text('YIHOU'),
      ));
}


  // StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (snapshot.hasError) {
      //         return const Center(child: Text('Something went wrong!'));
      //       } else if (snapshot.hasData) {
      //         return Dashboard();
      //       } else {
      //         return LoginPage();
      //       }
      //     })
