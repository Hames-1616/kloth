import 'package:flutter/material.dart';
import 'package:kloth/utlis/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: primaryAccent),
      ),
    );
  }
}
