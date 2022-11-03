import 'dart:ui';

import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/domain/models/response/response_post.dart';

import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _start = 0;
  final int _limit = 2;
  late ScrollController _controller;
  @override
  void initState() {
    super.initState();

    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Current Location",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Semarang,Jawa Tengah",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/svg/notification-icon.svg',
                              height: 28)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: 'Cari pekerjaan disini',
                //     hintStyle: const TextStyle(fontSize: 16),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide: const BorderSide(
                //         width: 0,
                //         style: BorderStyle.none,
                //       ),
                //     ),
                //     filled: true,
                //     fillColor: Colors.grey[100],
                //     contentPadding: const EdgeInsets.only(
                //       right: 30,
                //     ),
                //     prefixIcon: const Padding(
                //       padding: EdgeInsets.only(right: 10.0, left: 10.0),
                //       child: Icon(
                //         Icons.search,
                //         color: Colors.black,
                //         size: 24,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
              ],
            ),
          ),
          // Expanded(
          //   child: FutureBuilder<List<Post>>(
          //     future: postService.getAllPostHome(_start, _limit),
          //     builder: (_, snapshot) {
          //       if (snapshot.data != null && snapshot.data!.isEmpty) {
          //         return _ListWithoutPosts();
          //       }

          //       return !snapshot.hasData
          //           ? Column(
          //               children: const [
          //                 ShimmerPost(),
          //                 SizedBox(height: 10.0),
          //                 ShimmerPost(),
          //                 SizedBox(height: 10.0),
          //                 ShimmerPost(),
          //               ],
          //             )
          //           // : ListView.builder(
          //           //     controller: _controller,
          //           //     shrinkWrap: true,
          //           //     itemCount: snapshot.data!.length,
          //           //     itemBuilder: (_, i) =>
          //           //         _ListViewPosts(posts: snapshot.data![i]),
          //           //   );

          //           : ListView.builder(
          //               shrinkWrap: true,
          //               controller: _controller,
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (_, i) =>
          //                   _ListViewPosts(posts: snapshot.data![i]),
          //             );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void _loadMore() async {
    print('asss');
  }
}

Widget makeLike() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: const Center(
      child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
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

class _ListViewPosts extends StatelessWidget {
  final Post posts;

  const _ListViewPosts({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final postBloc = BlocProvider.of<PostBloc>(context);

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
              padding: const EdgeInsets.only(left: 10, right: 10),
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextCustom(
                  text: posts.desc, fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              child: CarouselSlider.builder(
                itemCount: listImages.length,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  height: 50,
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      makeLike(),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2.5K",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      )
                    ],
                  ),
                  Text(
                    "400 Applicantor",
                    style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    makeLikeButton(isActive: true),
                    makeCommentButton(),
                    makeShareButton(),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListWithoutPosts extends StatelessWidget {
  final List<String> svgPosts = [
    'assets/svg/without-posts-home.svg',
    'assets/svg/without-posts-home.svg',
    'assets/svg/mobile-new-posts.svg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.all(10.0),
          height: 350,
          width: size.width,
          // color: Colors.amber,
          child: SvgPicture.asset(svgPosts[index], height: 15),
        ),
      ),
    );
  }
}
