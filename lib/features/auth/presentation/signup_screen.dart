import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_project/assets/icons.dart';
import 'package:med_project/core/widgets/w_button.dart';
import 'package:med_project/core/widgets/w_scale.dart';
import 'package:med_project/core/widgets/w_textfield.dart';
import 'package:med_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:med_project/features/auth/presentation/login_screen.dart';
import 'package:med_project/features/home/home.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController mailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(100 + MediaQuery.of(context).padding.top),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 16,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WScaleAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(AppIcons.arrowLeft),
                ),
              ),
              Align(child: SvgPicture.asset(AppIcons.logoMain)),
              const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(width: 24),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              child: Column(
                children: [
                  Text(
                    "SignUp".trim(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 34),
                  WTextField(
                    title: 'Email',
                    fillColor: Colors.white,
                    hintText: 'Email',
                    /* contentPadding: const EdgeInsets.fromLTRB(48, 12, 12, 12), */
                    controller: mailController,
                    onChanged: (_) {},
                    onEditCompleted: () {
                      FocusScope.of(context).nextFocus();
                    },
                    keyBoardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  WTextField(
                    title: 'Maxfiylik kaliti',
                    fillColor: Colors.white,
                    hintText: 'Maxfiylik kalitini kiriting...',
                    keyBoardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    onChanged: (_) {},
                    isObscureText: true,
                    onEditCompleted: () {
                      FocusScope.of(context).unfocus();
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 16),
                  WButton(
                    margin: const EdgeInsets.all(0),
                    border: Border.all(width: 1, color: Color(0XFFECEDF0)),
                    onTap: () {
                      context.read<AuthBloc>().add(
                            AuthenticationSignUpEvent(
                              email: mailController.text,
                              password: passwordController.text,
                              onSuccess: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (_) =>  HomePage()),
                                  (route) => false,
                                );
                              },
                              onFailure: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)));
                              },
                            ),
                          );
                    },
                    text: "Ro'yxatdan o'tish",
                    textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          WButton(
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0XFFECEDF0)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            text: "Kirish",
            textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
