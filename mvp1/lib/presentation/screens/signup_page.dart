// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvp1/presentation/commons/shapes.dart';
import 'package:mvp1/presentation/components/neumorphic__text_field.dart';
import 'package:mvp1/presentation/screens/signin_page.dart';

import '../components/rounded_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final backgroundColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            width: size.width,
            color: backgroundColor,
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.deepPurple.shade200,
                      )),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: topSignUpShape, // Voir fichier shapes.dart
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomSignUpShape, // Voir fichier shapes.dart
                ),
                Positioned(
                  top: size.height * 0.25,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Inscription',
                            style: TextStyle(
                                fontFamily: 'DancingScript', fontSize: 40)),
                        const Text(
                          'Veuillez compléter le formulaire ci-dessous',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'DancingScript'),
                        ),
                        SizedBox(height: size.height * 0.06),
                        NeumorphicTextField(
                          isObscure: false,
                          labelText: 'Email',
                          hintText: 'Exemple@exemple.com',
                          prefixIcon: const Icon(Icons.mail),
                          backgroundColor: backgroundColor,
                        ),
                        SizedBox(height: size.height * 0.04),
                        NeumorphicTextField(
                          isObscure: true,
                          labelText: 'Password',
                          hintText: 'VotreMotDePasse',
                          prefixIcon: const Icon(Icons.lock),
                          backgroundColor: backgroundColor,
                        ),
                        SizedBox(height: size.height * 0.04),
                        NeumorphicTextField(
                          isObscure: true,
                          labelText: 'Confirmation mot de pase',
                          hintText: 'VotreMotDePasse',
                          prefixIcon: const Icon(Icons.lock),
                          backgroundColor: backgroundColor,
                        ),
                        SizedBox(height: size.height * 0.04),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RoundedButton(
                            buttonIcon: Icons.arrow_forward,
                            buttonText: "S'inscrire",
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Déjà un compte ? ',
                              style: TextStyle(
                                  fontFamily: 'DancingScript', fontSize: 18.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                debugPrint("S'inscrire");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              },
                              child: Text(
                                "Se connecter",
                                style: TextStyle(
                                    color: Colors.deepPurple.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript',
                                    fontSize: 18.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
