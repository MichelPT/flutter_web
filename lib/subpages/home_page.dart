import 'package:flutter/material.dart';

class HomeSubPage extends StatelessWidget {
  const HomeSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Activities'),
        Text('About'),
        Text('Tips'),
      ],
    );
  }
}
