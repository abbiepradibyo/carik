import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerLocation extends StatelessWidget {
  const ShimmerLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsCk.shimmerbase,
        highlightColor: ColorsCk.shimmerhighlight,
        direction: ShimmerDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
              ],
            ),
          ],
        ));
  }
}
