import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsCk.shimmerbase,

      highlightColor: ColorsCk.shimmerhighlight,
      direction: ShimmerDirection.ltr,
      // baseColor: const Color.fromARGB(255, 212, 190, 190),
      // highlightColor: const Color.fromARGB(255, 212, 190, 190),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
          ),
          const SizedBox(
            height: 10,
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 50,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(color: Colors.grey[200]),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 5, right: 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Row(
          //         children: <Widget>[
          //           Container(
          //             height: 5,
          //             width: MediaQuery.of(context).size.width,
          //             decoration: BoxDecoration(color: Colors.grey[200]),
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           Container(
          //             height: 5,
          //             width: MediaQuery.of(context).size.width,
          //             decoration: BoxDecoration(color: Colors.grey[200]),
          //           ),
          //         ],
          //       ),
          //       Text(
          //         "400 Applicantor",
          //         style: TextStyle(fontSize: 13, color: Colors.grey[800]),
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //     padding: const EdgeInsets.only(left: 15, right: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Container(
          //           height: 5,
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(color: Colors.grey[200]),
          //         ),
          //         Container(
          //           height: 5,
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(color: Colors.grey[200]),
          //         ),
          //         Container(
          //           height: 5,
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(color: Colors.grey[200]),
          //         ),
          //       ],
          //     )),
          // const SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
}
