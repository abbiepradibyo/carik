import 'dart:ui';

import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/domain/models/response/response_post.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:cached_network_image/cached_network_image.dart';

class ListViewPosts extends StatefulWidget {
  final Post posts;

  const ListViewPosts({Key? key, required this.posts}) : super(key: key);

  @override
  State<ListViewPosts> createState() => _ListViewPostsState();
}

class _ListViewPostsState extends State<ListViewPosts> {
  int currentPos = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> listImages = widget.posts.images.split(',');
    final time = timeago.format(widget.posts.createdAt, locale: 'en_short');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        height: 350,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.grey[100]),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: CarouselSlider.builder(
                itemCount: listImages.length,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  height: 350,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    Environment.baseUrl + widget.posts.avatar),
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(
                                      text: widget.posts.username,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  TextCustom(
                                      text: time,
                                      fontSize: 15,
                                      color: Colors.white),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_rounded,
                                  color: Colors.white, size: 25))
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        height: 45,
                        width: size.width * .9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              color: Colors.white.withOpacity(0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () => {},
                                            child: widget.posts.isLike == 1
                                                ? const Icon(
                                                    Icons.favorite_rounded,
                                                    color: Colors.red)
                                                : const Icon(
                                                    Icons
                                                        .favorite_outline_rounded,
                                                    color: Colors.white),
                                          ),
                                          const SizedBox(width: 8.0),
                                          InkWell(
                                              onTap: () {},
                                              child: TextCustom(
                                                  text: widget.posts.countLikes
                                                      .toString(),
                                                  fontSize: 16,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      const SizedBox(width: 20.0),
                                      TextButton(
                                        onPressed: () => {},
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/message-icon.svg',
                                                color: Colors.white),
                                            const SizedBox(width: 5.0),
                                            TextCustom(
                                                text: "1",
                                                fontSize: 16,
                                                color: Colors.white)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              'assets/svg/send-icon.svg',
                                              height: 24,
                                              color: Colors.white)),
                                      IconButton(
                                          onPressed: () => {},
                                          icon: const Icon(
                                              Icons.bookmark_border_rounded,
                                              size: 27,
                                              color: Colors.white))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
