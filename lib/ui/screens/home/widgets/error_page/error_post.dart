import 'package:flutter/material.dart';

class ErrorPostPage extends StatelessWidget {
  const ErrorPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("error page!"),
        ],
      ),
    );
  }
}
