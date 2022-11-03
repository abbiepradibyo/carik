import 'package:flutter/material.dart';

class NoRecordPost extends StatelessWidget {
  const NoRecordPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("No data found on your area,please change location"),
        ],
      ),
    );
  }
}
