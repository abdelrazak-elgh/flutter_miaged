import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';

class InitialNavigationView extends StatelessWidget {
  const InitialNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).popAndPushNamed('/home');
            } else {
              Navigator.of(context).pushNamed('/home');
            }
          }
          if (state is AuthenticationFailure) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).popAndPushNamed('/signin');
            } else {
              Navigator.of(context).pushNamed('/signin');
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

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//       if (state is AuthenticationSuccess) {
//         return HomeView();
//       } else {
//         return const SignInView();
//       }
//     });
//   }
// }

  // @override
  // Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
  //       listener: (context, state) {
  //         if (state is AuthUserConnectionInProgress) {
  //           if (Navigator.of(context).canPop()) {
  //             Navigator.of(context).popAndPushNamed('/dashboard');
  //           } else {
  //             Navigator.of(context).pushNamed('/dashboard');
  //           }
  //         }
  //         if (state is AuthUserUnconnected) {
  //           if (Navigator.of(context).canPop()) {
  //             Navigator.of(context).popAndPushNamed('/signin');
  //           } else {
  //             Navigator.of(context).pushNamed('/signin');
  //           }
  //         }
  //         if (state is AuthSignOutInProgress) {
  //           Navigator.of(context)
  //               .pushNamedAndRemoveUntil('/signin', (route) => route.isFirst);
  //         }
  //         if (state is AuthError) {
  //           if (kDebugMode) {
  //             print(state.authError);
  //           }
  //         }
  //       },
  //       builder: (context, state) {
  //         return const Center(
  //           child: Icon(Icons.home),
  //         );
  //       },
  //     );
  //}

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
