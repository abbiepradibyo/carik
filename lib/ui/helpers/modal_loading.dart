import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:carikerja/ui/themes/colors_ck.dart';

void modalLoading(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white54,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircularProgressIndicator(color: ColorsCk.primary),
                const SizedBox(width: 15.0),
                TextCustom(text: text)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
