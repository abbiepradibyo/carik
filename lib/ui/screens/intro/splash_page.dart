import 'package:carikerja/ui/helpers/animation_route.dart';
import 'package:carikerja/ui/screens/home/home_page.dart';
import 'package:carikerja/ui/screens/login/strated_page.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carikerja/domain/blocs/blocs.dart';
import 'package:carikerja/ui/themes/colors_ck.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOut) {
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const StartedPage()), (_) => false);
        } else if (state is SuccessAuthentication) {
          userBloc.add(OnGetUserAuthenticationEvent());
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const HomePage()), (_) => false);
        }
      },
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    colors: [
                      ColorsCk.secundary,
                      ColorsCk.primary,
                      Colors.white
                    ])),
            child: Center(
              child: SizedBox(
                height: 200,
                width: 150,
                child: Column(
                  children: [
                    AnimatedBuilder(
                        animation: _animationController,
                        builder: (_, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Image.asset('assets/img/logo-white.png'))),
                    const SizedBox(height: 10.0),
                    const TextCustom(text: 'Loading...', color: Colors.white)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}