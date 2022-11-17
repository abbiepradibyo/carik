import 'package:carikerja/domain/blocs/categori/categori_bloc.dart';
import 'package:carikerja/domain/blocs/location/location_bloc.dart';
import 'package:carikerja/domain/blocs/post/post_bloc.dart';
import 'package:carikerja/ui/screens/home/widgets/bottom_loader.dart';
import 'package:carikerja/ui/screens/home/widgets/custom_tab.dart';
import 'package:carikerja/ui/screens/home/widgets/error_page/error_location.dart';
import 'package:carikerja/ui/screens/home/widgets/error_page/error_post.dart';
import 'package:carikerja/ui/screens/home/widgets/error_page/norecord_post.dart';
import 'package:carikerja/ui/screens/home/widgets/list_post.dart';
import 'package:carikerja/ui/screens/home/widgets/shimmer/shimmer_location.dart';
import 'package:carikerja/ui/screens/home/widgets/shimmer/shimmer_post.dart';
import 'package:carikerja/ui/screens/login/login_page.dart';
import 'package:carikerja/ui/screens/login/strated_page.dart';
import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isdisable = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(
            hideNavigation: hideNav,
            showNavigation: showNav,
          ),
          const StartedPage(),
          const LoginPage(),
          const LoginPage(),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isdisable ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  currentIndex = index;

                  print(currentIndex);
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: currentIndex == 0
                        ? SvgPicture.asset(
                            'assets/icon/home_solid.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/icon/home.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: currentIndex == 1
                        ? SvgPicture.asset(
                            'assets/icon/search_solid.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/icon/serach.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),
                    label: "Cari"),
                BottomNavigationBarItem(
                    icon: currentIndex == 2
                        ? SvgPicture.asset(
                            'assets/icon/add.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/icon/add.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),
                    label: "Post"),
                BottomNavigationBarItem(
                    icon: currentIndex == 3
                        ? SvgPicture.asset(
                            'assets/icon/bookmark_solid.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/icon/bookmark.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),
                    label: "Save"),
                BottomNavigationBarItem(
                    icon: currentIndex == 4
                        ? SvgPicture.asset(
                            'assets/icon/user_solid.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/icon/user.svg',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),
                    label: "Profil"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void hideNav() {
    setState(() {
      isdisable = false;
    });
  }

  void showNav() {
    setState(() {
      isdisable = true;
    });
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;

  const HomePage(
      {Key? key, required this.showNavigation, required this.hideNavigation})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  late PostBloc postBloc;
  late CategoriBloc categoriBloc;
  late LocationBloc locationBloc;
  bool isLoadingMore = false;

  bool isdisable = false;

  void _scrollToTop() {
    _controller.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  @override
  void initState() {
    print('aaa');
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
      body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              print('ssuuuuuu');
              setState(() {
                //isdisable = true;
                widget.showNavigation();
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              print('siiiiiiii');
              setState(() {
                // isdisable = false;
                widget.hideNavigation();
              });
            }

            return true;
          },
          child: NestedScrollView(
              controller: _controller,
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    floating: true,
                    snap: true,
                    pinned: true,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://asset.kompas.com/crops/29NIL8HUEPxfVvJsJOTS0KVTsJI=/67x0:1000x622/750x500/data/photo/2022/05/10/6279dbc56fe02.jpg"),
                      ),
                    ),

                    leadingWidth: 70,
                    title: SafeArea(
                        top: false,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BlocBuilder<LocationBloc, LocationState>(
                                  builder: (context, state) {
                                if (state is LocationInitial) {
                                  return const ShimmerLocation();
                                } else if (state is LocationLoaded) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: const <Widget>[
                                          TextCustom(
                                            textAlign: TextAlign.center,
                                            text: "Current Location",
                                            fontSize: 12,
                                            color: Color(0xFF333333),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      TextCustom(
                                        text: state.location,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF333333),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const ErrorLocationPage();
                                }
                              }),
                            ])),
                    // ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icon/notification.svg',
                            color: Colors.black,
                            height: 30,
                            width: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //       right: 10, top: 10, bottom: 10),
                      //   width: 35,
                      //   height: 35,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xFFf3f3f3),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: IconButton(
                      //     icon:
                      //         const Icon(Icons.notifications_rounded, size: 20),
                      //     color: Colors.black,
                      //     highlightColor: Colors.black,
                      //     onPressed: () {},
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //       right: 10, top: 10, bottom: 10),
                      //   width: 35,
                      //   height: 35,
                      //   decoration: BoxDecoration(

                      //     color: const Color(0xFFf3f3f3),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: IconButton(
                      //     icon: const Icon(Icons.search, size: 20),
                      //     color: Colors.black,
                      //     highlightColor: Colors.black,
                      //     onPressed: () {},
                      //   ),
                      // ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(65),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: BlocBuilder<CategoriBloc, CategoriState>(
                            builder: (context, state) {
                          if (state is CategoriInitialNotFound) {
                            return const SizedBox(
                              height: 10,
                            );
                          } else if (state is LoadedCategori) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              height: 20,
                              child: DefaultTabController(
                                length: state.categorilist.length,
                                child: TabBar(
                                  labelPadding: const EdgeInsets.all(0),
                                  indicatorPadding: const EdgeInsets.all(0),
                                  isScrollable: true,
                                  labelColor: ColorsCk.secundary,
                                  unselectedLabelColor: Colors.black87,
                                  labelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  indicator: RoundedRectangleTabIndicator(
                                      weight: 2,
                                      width: 10,
                                      color: ColorsCk.secundary),
                                  tabs: List<Widget>.generate(
                                      state.categorilist.length, (int index) {
                                    return Tab(
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 18),
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
                    ),
                  )
                ];
              },
              body: SizedBox(
                // color: Colors.black12,
                height: queryData.size.height * 0.90,
                child:
                    BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                  if (state is PostInitialNotFound) {
                    return const NoRecordPost();
                  } else if (state is LoadedPost) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 5),
                        shrinkWrap: true,
                        // controller: _controller,
                        itemCount: state.postlist.length,
                        itemBuilder: (_, i) {
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
              ))),
    );
  }

  void _loadMore() async {
    print('sssssssssssssssss');
    if (_controller.hasClients &&
        _controller.position.pixels == _controller.position.maxScrollExtent) {
      postBloc.add(FetchPost());
      setState(() {
        isLoadingMore = true;
      });
    }
  }
}
