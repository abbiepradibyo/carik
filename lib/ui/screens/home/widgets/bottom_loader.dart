import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: ColorsCk.shimmerbase,
            ),
          ),
        ),
      ),
    );
  }
}
