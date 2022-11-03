import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorLocationPage extends StatelessWidget {
  const ErrorLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Current Location",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "not found",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/notification-icon.svg',
                  height: 28)),
        ),
      ],
    );
  }
}
