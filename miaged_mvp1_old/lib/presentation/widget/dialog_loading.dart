import 'package:flutter/material.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
