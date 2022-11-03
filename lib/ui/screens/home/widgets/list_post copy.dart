import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/domain/models/response/response_post.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListViewPosts extends StatelessWidget {
  final Post posts;

  const ListViewPosts({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listImages = posts.images.split(',');
    final time = timeago.format(posts.createdAt, locale: 'en');

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 10.0, color: Colors.black26),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(Environment.baseUrl + posts.avatar),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextCustom(
                              text: posts.username,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          const SizedBox(
                            height: 3,
                          ),
                          TextCustom(
                              text: time, fontSize: 14, color: Colors.black54)
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      size: 25,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextCustom(
                  text: posts.desc, fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            posts.images != ""
                ? ClipRRect(
                    child: CarouselSlider.builder(
                      itemCount: listImages.length,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        height: 250,
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: false,
                      ),
                      itemBuilder: (context, i, realIndex) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    Environment.baseUrl + listImages[i]))),
                      ),
                    ),
                  )
                : const SizedBox(height: 1),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Center(
                        child: Icon(Icons.location_on_outlined,
                            size: 22, color: Colors.grey[800]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "1,4 km",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      )
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Center(
                        child: Icon(Icons.favorite_outline,
                            size: 22, color: Colors.grey[800]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2.5K",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      )
                    ],
                  ),
                  // Text(
                  //   "400 Applicantor",
                  //   style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //     padding: const EdgeInsets.only(left: 15, right: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         makeLikeButton(isActive: true),
            //         makeCommentButton(),
            //         makeShareButton(),
            //       ],
            //     )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
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
