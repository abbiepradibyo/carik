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
    final List<String> listImages = widget.posts.images.split(',');
    final time = timeago.format(widget.posts.createdAt, locale: 'en_short');

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          color: const Color(0xFFd9d9d9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 15, left: 15),
                                child: Row(children: <Widget>[
                                  Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            Environment.baseUrl +
                                                widget.posts.avatar),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextCustom(
                                        text: widget.posts.username,
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                              const Icon(
                                                  Icons.access_time_filled,
                                                  size: 12,
                                                  color: Colors.black45),
                                            ])),
                                  ])
                                ])),
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(Icons.more_vert_outlined,
                                  size: 24, color: Colors.black54),
                            )
                          ]),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 15, left: 15),
                        child: TextCustom(
                            text: widget.posts.desc,
                            fontSize: 14,
                            color: Colors.black87,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis),
                      ),
                      widget.posts.images != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(25),
                                child: CarouselSlider.builder(
                                  itemCount: listImages.length,
                                  options: CarouselOptions(
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: false,
                                      height: queryData.size.height * 0.50,
                                      scrollPhysics:
                                          const BouncingScrollPhysics(),
                                      autoPlay: false,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentPos = index;
                                        });
                                      }),
                                  itemBuilder: (context, i, realIndex) =>
                                      Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                Environment.baseUrl +
                                                    listImages[i]))),
                                  ),
                                ),
                              ))
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/icon/marker.svg',
                                      color: Colors.black,
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextCustom(
                                    text: "1,4",
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/icon/heart.svg',
                                      color: Colors.black,
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextCustom(
                                    text: "2.5",
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ]),
                            Row(
                              children: [
                                listImages.length > 1
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: listImages.map((url) {
                                          int index = listImages.indexOf(url);
                                          return Container(
                                            width:
                                                currentPos == index ? 6.0 : 5.0,
                                            height:
                                                currentPos == index ? 6.0 : 5.0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentPos == index
                                                  ? Colors.black54
                                                  : Colors.black26,
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icon/bookmark.svg',
                                color: Colors.black,
                                height: 25,
                                width: 25,
                              ),
                              onPressed: () {},
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
      ],
    );
  }
}
