import 'package:carikerja/domain/blocs/blocs.dart';

import 'package:carikerja/ui/screens/home/widgets/bottom_loader.dart';

import 'package:carikerja/ui/screens/home/widgets/custom_tab.dart';
import 'package:carikerja/ui/screens/home/widgets/error_page/error_location.dart';

import 'package:carikerja/ui/screens/home/widgets/error_page/error_post.dart';
import 'package:carikerja/ui/screens/home/widgets/error_page/norecord_post.dart';
import 'package:carikerja/ui/screens/home/widgets/list_post.dart';
import 'package:carikerja/ui/screens/home/widgets/shimmer/shimmer_location.dart';
import 'package:carikerja/ui/screens/home/widgets/shimmer/shimmer_post.dart';
import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

String selectedCategorie = "Adults";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  late PostBloc postBloc;
  late CategoriBloc categoriBloc;
  late LocationBloc locationBloc;
  bool isLoadingMore = false;

  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.add(OnCheckingLocation());
    categoriBloc = BlocProvider.of<CategoriBloc>(context);
    categoriBloc.add(FetchCategori());
    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPost());
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: queryData.size.width * 0.5,
        toolbarHeight: 70,
        leading: Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: SvgPicture.asset("assets/svg/logo.svg",
                width: queryData.size.width * 0.3, fit: BoxFit.scaleDown)),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * .80,
        child: SingleChildScrollView(
          // controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     // mainAxisAlignment: MainAxisAlignment.end,
              //     children: <Widget>[
              //       Container(
              //           color: Colors.white,
              //           child: SvgPicture.asset("assets/svg/logo.svg",
              //               width: queryData.size.width * 0.3,
              //               fit: BoxFit.scaleDown)),
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(30),
              //         child: IconButton(
              //           splashRadius: 20,
              //           onPressed: () {},
              //           icon: const Icon(
              //             Icons.search,
              //             color: Colors.black,
              //             size: 30,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   width: queryData.size.width,
              //   height: queryData.size.height * 0.12,
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         top: 15, right: 10, left: 15, bottom: 15),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           Container(
              //             color: Colors.yellow,
              //             alignment: Alignment.topLeft,
              //             child: SvgPicture.asset("assets/svg/logo.svg",
              //                 // width: queryData.size.width * 0.5,
              //                 fit: BoxFit.scaleDown),
              //           ),
              //           const SizedBox(
              //             width: 20,
              //           ),
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: IconButton(
              //               splashRadius: 20,
              //               onPressed: () {},
              //               icon: const Icon(
              //                 Icons.search,
              //                 color: Colors.black,
              //                 size: 30,
              //               ),
              //             ),
              //           ),
              //         ]),
              //   ),
              // ),
              // Expanded(
              //   flex: 3,
              //   child: Padding(
              //       padding: const EdgeInsets.only(top: 40, right: 10, left: 15),
              //       child: BlocBuilder<LocationBloc, LocationState>(
              //           builder: (context, state) {
              //         if (state is LocationInitial) {
              //           return const ShimmerLocation();
              //         } else if (state is LocationLoaded) {
              //           return Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: <Widget>[
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                   const Text(
              //                     "Current Location",
              //                     style: TextStyle(
              //                         fontSize: 14,
              //                         color: Color.fromARGB(255, 77, 76, 76)),
              //                   ),
              //                   const SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(children: <Widget>[
              //                     const Icon(
              //                       Icons.location_on,
              //                       color: Colors.black,
              //                       size: 18,
              //                     ),
              //                     Text(
              //                       state.location,
              //                       style: const TextStyle(
              //                           fontSize: 14, fontWeight: FontWeight.bold),
              //                     )
              //                   ]),
              //                 ],
              //               ),

              //               // ClipRRect(
              //               //   borderRadius: BorderRadius.circular(30),
              //               //   child: IconButton(
              //               //       splashRadius: 20,
              //               //       onPressed: () {},
              //               //       icon: SvgPicture.asset(
              //               //           'assets/svg/notification-icon.svg',
              //               //           height: 28)),
              //               // ),
              //               ClipRRect(
              //                 borderRadius: BorderRadius.circular(30),
              //                 child: IconButton(
              //                   splashRadius: 20,
              //                   onPressed: () {},
              //                   icon: const Icon(
              //                     Icons.notifications_outlined,
              //                     color: Colors.black,
              //                     size: 26,
              //                   ),
              //                 ),
              //               ),
              //               // ClipRRect(
              //               //   borderRadius: BorderRadius.circular(30),
              //               //   child: IconButton(
              //               //     splashRadius: 20,
              //               //     onPressed: () {},
              //               //     icon: const Icon(
              //               //       Icons.search,
              //               //       color: Colors.black,
              //               //       size: 26,
              //               //     ),
              //               //   ),
              //               // ),
              //             ],
              //           );
              //         } else {
              //           return const ErrorLocationPage();
              //         }
              //       })),
              // ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 5, left: 5, bottom: 5),
                  child: BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                    if (state is LocationInitial) {
                      return const ShimmerLocation();
                    } else if (state is LocationLoaded) {
                      return Container(
                        width: queryData.size.width,
                        height: queryData.size.height * 0.085,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3C4048),
                          borderRadius: BorderRadius.circular(15),
                          // image: const DecorationImage(
                          //   alignment: Alignment.centerLeft,
                          //   image: AssetImage("assets/img/bg_loc.png"),
                          //   fit: BoxFit.contain,
                          // ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 15, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFB2B2B2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Color(0xFFEAEAEA),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const TextCustom(
                                      text: "Current Location",
                                      fontSize: 12,
                                      color: Color(0xFFEAEAEA),
                                    ),
                                    TextCustom(
                                      text: state.location,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFEAEAEA),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 52,
                                  width: 52,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFFEAEAEA),
                                    size: 20,
                                  ),
                                ),
                              ]),
                        ),
                      );
                      // return Container(
                      //   width: queryData.size.width,
                      //   height: queryData.size.height * 0.12,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xFFF5CEB8),
                      //     borderRadius: BorderRadius.circular(15),
                      //     image: const DecorationImage(
                      //       alignment: Alignment.centerLeft,
                      //       image: AssetImage("assets/img/bg_loc.png"),
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //         top: 15, right: 10, left: 15, bottom: 15),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: <Widget>[
                      //           Container(
                      //             alignment: Alignment.center,
                      //             height: 52,
                      //             width: 52,
                      //             decoration: const BoxDecoration(
                      //               color: Color(0xFFF2BEA1),
                      //               shape: BoxShape.circle,
                      //             ),
                      //             child: const Icon(
                      //               Icons.location_on,
                      //               color: Color(0xFFff0000),
                      //               size: 20,
                      //             ),
                      //           ),
                      //           const SizedBox(
                      //             width: 20,
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: const <Widget>[
                      //               Text(
                      //                 "Current Location",
                      //                 style: TextStyle(
                      //                     fontSize: 13, color: Colors.black54),
                      //               ),
                      //               SizedBox(
                      //                 height: 5,
                      //               ),
                      //               Text(
                      //                 'Semarang Jawa, Tengah',
                      //                 style: TextStyle(
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.bold),
                      //               )
                      //             ],
                      //           ),
                      //           const SizedBox(
                      //             width: 20,
                      //           ),
                      //           Container(
                      //             alignment: Alignment.center,
                      //             height: 52,
                      //             width: 52,
                      //             decoration: const BoxDecoration(
                      //               shape: BoxShape.circle,
                      //             ),
                      //             child: const Icon(
                      //               Icons.arrow_forward_ios,
                      //               color: Colors.black54,
                      //               size: 20,
                      //             ),
                      //           ),
                      //         ]),
                      //   ),
                      // );
                    } else {
                      return const ErrorLocationPage();
                    }
                  })),
              // Expanded(
              //   flex: 2,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         TextField(
              //           decoration: InputDecoration(
              //             hintText: 'Cari pekerjaan disini',
              //             hintStyle: const TextStyle(fontSize: 16),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15),
              //               borderSide: const BorderSide(
              //                 width: 0,
              //                 style: BorderStyle.none,
              //               ),
              //             ),
              //             filled: true,
              //             fillColor: Colors.grey[100],
              //             contentPadding: const EdgeInsets.only(
              //               right: 30,
              //             ),
              //             prefixIcon: const Padding(
              //               padding: EdgeInsets.only(right: 10.0, left: 10.0),
              //               child: Icon(
              //                 Icons.search,
              //                 color: Colors.black,
              //                 size: 24,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.only(top: 5, right: 10, left: 15, bottom: 5),
              //     child: Text(
              //       "Category",
              //       style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.black,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ),
              // ),
              // Expanded(
              //     child: SizedBox(
              //   height: 30,
              //   child: ListView.builder(
              //       itemCount: categories.length,
              //       shrinkWrap: true,
              //       physics: const ClampingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Categories(
              //           categorie: categories[index],
              //           isSelected: selectedCategorie == categories[index],
              //         );
              //       }),
              // )),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, right: 10),
              //   child: BlocBuilder<CategoriBloc, CategoriState>(
              //       builder: (context, state) {
              //     if (state is CategoriInitialNotFound) {
              //       return const SizedBox(
              //         height: 10,
              //       );
              //     } else if (state is LoadedCategori) {
              //       return SizedBox(
              //         height: 30,
              //         child: ListView.builder(
              //             itemCount: state.categorilist.length,
              //             shrinkWrap: true,
              //             physics: const ClampingScrollPhysics(),
              //             scrollDirection: Axis.horizontal,
              //             itemBuilder: (context, index) {
              //               return Categories(
              //                 categorie: state.categorilist[index].categori,
              //                 isSelected: selectedCategorie == categories[index],
              //               );
              //             }),
              //       );
              //     } else if (state is CategoriInitial) {
              //       return SingleChildScrollView(
              //           child: Column(
              //         children: const [
              //           ShimmerLocation(),
              //         ],
              //       ));
              //     } else {
              //       return const SizedBox();
              //     }
              //   }),
              // ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, bottom: 10, left: 10),
                child: BlocBuilder<CategoriBloc, CategoriState>(
                    builder: (context, state) {
                  if (state is CategoriInitialNotFound) {
                    return const SizedBox(
                      height: 10,
                    );
                  } else if (state is LoadedCategori) {
                    // return SizedBox(
                    //   height: 30,
                    //   child: ListView.builder(
                    //       itemCount: state.categorilist.length,
                    //       shrinkWrap: true,
                    //       physics: const ClampingScrollPhysics(),
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return Categories(
                    //           categorie: state.categorilist[index].categori,
                    //           isSelected: selectedCategorie == categories[index],
                    //         );
                    //       }),
                    // );

                    return Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      height: 25,
                      child: DefaultTabController(
                        length: state.categorilist.length,
                        child: TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          indicatorPadding: const EdgeInsets.all(0),
                          isScrollable: true,
                          labelColor: ColorsCk.secundary,
                          unselectedLabelColor: Colors.black87,
                          labelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          indicator: RoundedRectangleTabIndicator(
                              weight: 2, width: 10, color: ColorsCk.secundary),
                          tabs: List<Widget>.generate(state.categorilist.length,
                              (int index) {
                            return Tab(
                              child: Container(
                                margin: const EdgeInsets.only(right: 18),
                                child: Text(
                                  state.categorilist[index].categori,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  } else if (state is CategoriInitial) {
                    return SingleChildScrollView(
                        child: Column(
                      children: const [
                        ShimmerLocation(),
                      ],
                    ));
                  } else {
                    return const SizedBox();
                  }
                }),
              ),

              // const Padding(
              //   padding: EdgeInsets.only(right: 10, left: 15, top: 30),
              //   child: Text(
              //     "Nearby",
              //     style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),

              // Container(
              //   height: 200,
              //   color: Colors.red,
              // )

              SizedBox(
                // color: Colors.black12,
                height: queryData.size.height * 0.90,
                child:
                    BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                  if (state is PostInitialNotFound) {
                    return const NoRecordPost();
                  } else if (state is LoadedPost) {
                    return ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 5),
                        shrinkWrap: true,
                        controller: _controller,
                        itemCount: state.postlist.length,
                        itemBuilder: (_, i) {
                          print('=====');
                          print(state.postlist[i].desc);

                          print('====');
                          return (i + 1 == state.postlist.length)
                              ? state.hasMax
                                  ? ListViewPosts(posts: state.postlist[i])
                                  : const BottomLoader()
                              : ListViewPosts(posts: state.postlist[i]);
                        });
                  } else if (state is PostInitial) {
                    return SingleChildScrollView(
                        child: Column(
                      children: const [
                        ShimmerPost(),
                        ShimmerPost(),
                        ShimmerPost(),
                      ],
                    ));
                  } else {
                    return const ErrorPostPage();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loadMore() async {
    print(_controller.position.pixels);
    print(_controller.position.maxScrollExtent);
    print(_controller.hasClients);
    if (_controller.hasClients &&
        _controller.position.pixels == _controller.position.maxScrollExtent) {
      print('assshi');
      postBloc.add(FetchPost());
      setState(() {
        isLoadingMore = true;
      });
    }
  }
}
