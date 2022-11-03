import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/domain/models/response/response_post.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListViewPosts extends StatelessWidget {
  final Post posts;

  const ListViewPosts({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listImages = posts.images.split(',');
    final time = timeago.format(posts.createdAt, locale: 'en_short');
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          color: const Color(0xFFd9d9d9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   backgroundImage:
              //       NetworkImage(Environment.baseUrl + posts.avatar),
              // ),
              // Expanded(
              //   flex: 2,

              //   child: SizedBox(
              //     height: 45,
              //     width: 45,
              //     child: CircleAvatar(
              //       backgroundImage:
              //           NetworkImage(Environment.baseUrl + posts.avatar),
              //     ),
              //   ),
              //   // child: CachedNetworkImage(
              //   //   width: 50,
              //   //   height: 50,
              //   //   placeholder: (context, url) => Container(
              //   //       height: 50,
              //   //       width: 50,
              //   //       color: const Color(0xFFfde2bc)),
              //   //   errorWidget: (context, url, error) => Container(
              //   //     height: 50,
              //   //     width: 50,
              //   //     color: const Color(0xFFF5CEB8),
              //   //     child: const Icon(Icons.error),
              //   //   ),
              //   //   imageUrl: Environment.baseUrl + posts.avatar,
              //   // )
              // ),
              // const SizedBox(
              //   width: 5,
              // ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: NetworkImage(
                                  Environment.baseUrl + posts.avatar),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // CircleAvatar(

                        //   backgroundImage:
                        //       NetworkImage(Environment.baseUrl + posts.avatar),
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: TextCustom(
                              text: posts.username,
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextCustom(
                                        textAlign: TextAlign.left,
                                        text: time,
                                        fontSize: 12,
                                        color: Colors.black54,
                                        overflow: TextOverflow.clip,
                                        maxLines: 5),
                                    const SizedBox(
                                      child: TextCustom(
                                        text: ' . ',
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Icon(Icons.access_time_filled,
                                        size: 12, color: Colors.black45),
                                  ])),
                        ])
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: TextCustom(
                            text: posts.desc,
                            fontSize: 14,
                            color: Colors.black87,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis),
                      ),
                      // posts.images != ""
                      //     ? ClipRRect(
                      //         child: CarouselSlider.builder(
                      //           itemCount: listImages.length,
                      //           options: CarouselOptions(
                      //             viewportFraction: 1.0,
                      //             enableInfiniteScroll: false,
                      //             height: 250,
                      //             scrollPhysics: const BouncingScrollPhysics(),
                      //             autoPlay: false,
                      //           ),
                      //           itemBuilder: (context, i, realIndex) => Container(
                      //             decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     fit: BoxFit.cover,
                      //                     image: NetworkImage(
                      //                         Environment.baseUrl +
                      //                             listImages[i]))),
                      //           ),
                      //         ),
                      //       )
                      //     : const SizedBox(height: 1),

                      posts.images != ""
                          ? SizedBox(
                              child: MasonryGridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                              itemCount: listImages.length,
                              itemBuilder: (context, i) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(1),
                                    // child: Image.network(
                                    //   Environment.baseUrl + listImages[i],
                                    //   // height: 100.0,
                                    //   fit: BoxFit.cover,
                                    // ));

                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                          height: 100,
                                          width: 100,
                                          color: const Color(0xFFF5CEB8)),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 100,
                                        width: 100,
                                        color: const Color(0xFFF5CEB8),
                                        child: const Icon(Icons.error),
                                      ),
                                      imageUrl:
                                          Environment.baseUrl + listImages[i],
                                    ));
                              },
                            ))
                          : const SizedBox(height: 1),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: const <Widget>[
                                Center(
                                  child: Icon(Icons.location_on_rounded,
                                      size: 20, color: Colors.black45),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextCustom(
                                  text: "1,4",
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: <Widget>[
                                const Center(
                                  child: Icon(Icons.favorite_outline_rounded,
                                      size: 20, color: Colors.black45),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const TextCustom(
                                  text: "2.5",
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                                Text(listImages.length.toString())
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   height: 0.6,
        //   color: Colors.black12,
        // )
      ],
    );

    // return Padding(
    //   // padding: const EdgeInsets.only(bottom: 10),
    //   padding: const EdgeInsets.all(10),
    //   child: Container(
    //     color: Colors.yellow,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(left: 10, right: 10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   CircleAvatar(
    //                     backgroundImage:
    //                         NetworkImage(Environment.baseUrl + posts.avatar),
    //                   ),
    //                   const SizedBox(
    //                     width: 10,
    //                   ),
    //                   Expanded(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: <Widget>[
    //                         TextCustom(
    //                             text: posts.username,
    //                             fontSize: 18,
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold),
    //                         const SizedBox(
    //                           height: 3,
    //                         ),
    //                         TextCustom(
    //                             text: time,
    //                             fontSize: 11,
    //                             color: Colors.black54,
    //                             overflow: TextOverflow.clip,
    //                             maxLines: 5),
    //                         const SizedBox(height: 2),
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 10),
    //                           child: TextCustom(
    //                               text: posts.desc,
    //                               fontSize: 15,
    //                               color: Colors.black87),
    //                         ),

    //                         // posts.images != ""
    //                         //     ? ClipRRect(
    //                         //         child: CarouselSlider.builder(
    //                         //           itemCount: listImages.length,
    //                         //           options: CarouselOptions(
    //                         //             viewportFraction: 1.0,
    //                         //             enableInfiniteScroll: false,
    //                         //             height: 250,
    //                         //             scrollPhysics:
    //                         //                 const BouncingScrollPhysics(),
    //                         //             autoPlay: false,
    //                         //           ),
    //                         //           itemBuilder: (context, i, realIndex) =>
    //                         //               Container(
    //                         //             decoration: BoxDecoration(
    //                         //                 image: DecorationImage(
    //                         //                     fit: BoxFit.cover,
    //                         //                     image: NetworkImage(
    //                         //                         Environment.baseUrl +
    //                         //                             listImages[i]))),
    //                         //           ),
    //                         //         ),
    //                         //       )
    //                         //     : const SizedBox(height: 1),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 0),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             // mainAxisAlignment: MainAxisAlignment.end,
    //                             children: <Widget>[
    //                               Row(
    //                                 children: <Widget>[
    //                                   Center(
    //                                     child: Icon(Icons.location_on_outlined,
    //                                         size: 22, color: Colors.grey[800]),
    //                                   ),
    //                                   const SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text(
    //                                     "1,4 km",
    //                                     style: TextStyle(
    //                                       fontSize: 12,
    //                                       color: Colors.grey[800],
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                               const SizedBox(
    //                                 width: 20,
    //                               ),
    //                               Row(
    //                                 children: <Widget>[
    //                                   Center(
    //                                     child: Icon(Icons.favorite_outline,
    //                                         size: 22, color: Colors.grey[800]),
    //                                   ),
    //                                   const SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text(
    //                                     "2.5K",
    //                                     style: TextStyle(
    //                                       fontSize: 12,
    //                                       color: Colors.grey[800],
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                               // Text(
    //                               //   "400 Applicantor",
    //                               //   style: TextStyle(fontSize: 13, color: Colors.grey[800]),
    //                               // )
    //                             ],
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 10,
    //                         ),
    //                         // Padding(
    //                         //     padding: const EdgeInsets.only(left: 15, right: 15),
    //                         //     child: Row(
    //                         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         //       children: <Widget>[
    //                         //         makeLikeButton(isActive: true),
    //                         //         makeCommentButton(),
    //                         //         makeShareButton(),
    //                         //       ],
    //                         //     )),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               // IconButton(
    //               //   icon: Icon(
    //               //     Icons.more_horiz_outlined,
    //               //     size: 25,
    //               //     color: Colors.grey[600],
    //               //   ),
    //               //   onPressed: () {},
    //               // )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

Widget makeLike() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: const Center(
      child: Icon(Icons.favorite_outline, size: 25, color: Colors.black),
    ),
  );
}

Widget makeMap() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.red)),
    child: const Center(
      child: Icon(Icons.location_on_outlined, size: 18, color: Colors.black54),
    ),
  );
}

Widget makeLove() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: const Center(
      child: Icon(Icons.favorite, size: 12, color: Colors.white),
    ),
  );
}

Widget makeLikeButton({isActive}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            color: isActive ? Colors.blue : Colors.grey,
            size: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Like",
            style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeCommentButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.note_alt_outlined, color: Colors.grey, size: 18),
          SizedBox(
            width: 5,
          ),
          Text(
            "Apply",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeShareButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.bookmark_add_rounded, color: Colors.grey, size: 18),
          SizedBox(
            width: 5,
          ),
          Text(
            "Bookmark",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}
