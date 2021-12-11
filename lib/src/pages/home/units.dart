import 'package:flutter/material.dart';
import 'package:mini_app/src/components/custom_bar.dart';

class Units extends StatelessWidget {
  const Units({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomBar(),
        SizedBox(height: 20),
        Center(
          child: Text('Units'),
        ),
      ],
    );
  }
}
