import 'package:carikerja/ui/helpers/animation_route.dart';
import 'package:carikerja/ui/helpers/error_message.dart';
import 'package:carikerja/ui/helpers/modal_loading.dart';
import 'package:carikerja/ui/helpers/validate_form.dart';
import 'package:carikerja/ui/themes/btn_ck.dart';
import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:carikerja/ui/themes/field_ck.dart';
import 'package:carikerja/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carikerja/domain/blocs/blocs.dart';

import 'package:carikerja/ui/screens/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthentication) {
          modalLoading(context, 'loading...');
        } else if (state is FailureAuthentication) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SuccessAuthentication) {
          userBloc.add(OnGetUserAuthenticationEvent());
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const HomePage()), (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    const TextCustom(
                        text: 'Login Aplikasi!',
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: ColorsCk.secundary),

                    const SizedBox(height: 10.0),
                    const TextCustom(
                      text: 'login menggunakan email dan password.',
                      fontSize: 18,
                      letterSpacing: 1.0,
                    ),

                    const SizedBox(height: 70.0),
                    TextFieldCk(
                      controller: emailController,
                      hintText: 'Username',
                      keyboardType: TextInputType.emailAddress,
                      validator: validatedEmail,
                    ),

                    const SizedBox(height: 50.0),
                    TextFieldCk(
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      validator: passwordValidator,
                    ),

                    const SizedBox(height: 80.0),
                    BtnCk(
                      text: 'Login',
                      width: size.width,
                      onPressed: () {
                        // if (_keyForm.currentState!.validate()) {
                        //   authBloc.add(OnLoginEvent(emailController.text.trim(),
                        //       passwordController.text.trim()));
                        // }

                        authBloc.add(OnLoginEvent(
                            'abbiepradibyo@gmail.com', '1234567890'));
                      },
                    ),

                    const SizedBox(height: 30.0),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () => Navigator.push(context, routeSlide(page: const ForgotPasswordPage())),
                    //     child: const TextCustom(text: 'Olvide mi contraseña?')
                    //   )
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
