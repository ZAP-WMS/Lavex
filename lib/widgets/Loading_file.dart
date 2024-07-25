import 'package:flutter/material.dart';

class LoadingFile extends StatelessWidget {
  const LoadingFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularProgressIndicator()
            Image.asset('assets/tissue.gif'),
          ],
        ));
  }
}
