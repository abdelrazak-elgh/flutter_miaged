import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInProgress) {
            Navigator.of(context).pushNamed('/dashboard');
          }
          if (state is AuthAnonInProgress) {
            Navigator.of(context).pushNamed('/dashboard');
          }
          if (state is AuthUserCreateInProgress) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/signup');
          }
          if (state is AuthUserConnectInProgress) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/signin');
          }
          if (state is AuthSignOutInProgress) {
            Navigator.of(context).pushNamed('/signin');
          }
          if (state is AuthError) {
            if (kDebugMode) {
              print(state.authError);
            }
          }
        },
        builder: (context, state) {
          return const Center(
            child: Icon(Icons.home),
          );
        },
      );
}

// Showing the error message if the user has entered invalid credentials
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text(state.error.toString())));


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
