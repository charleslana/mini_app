import 'package:flutter/material.dart';
import 'package:mini_app/src/components/custom_bar.dart';

class Decks extends StatelessWidget {
  const Decks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: const [
          CustomBar(),
          SizedBox(height: 20),
          Center(
            child: Text('Decks'),
          ),
        ],
      ),
    );
  }
}
