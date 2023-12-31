import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/custom_textfield.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/navigatorAnimation.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/auth/controller/auth_controller.dart';
import 'package:kloth/features/auth/screens/resgister_page.dart';
import 'package:kloth/features/home/screens/homescreen.dart';
import 'package:kloth/utlis/color.dart';

class login_Page extends ConsumerStatefulWidget {
  const login_Page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _login_PageState();
}

class _login_PageState extends ConsumerState<login_Page> {
  Future<bool> login(WidgetRef ref, BuildContext context) {
    return ref
        .watch(authControllerProvider.notifier)
        .loginAccount(email.text, password.text, context);
  }

  final email = TextEditingController();
  final password = TextEditingController();
  bool color = false;
  bool disploading = false;

  @override
  Widget build(BuildContext context) {
    return ref.watch(authControllerProvider)
        ? const Loading()
        : Scaffold(
            body: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 200),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/logincover.png"),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height /
                          hei(context, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ResponsiveText(
                        text: "Sign ",
                        style: const TextStyle(
                            fontFamily: "Future",
                            fontSize: 30,
                            color: Colors.black),
                      ),
                      ResponsiveText(
                        text: "In",
                        style: const TextStyle(
                            fontFamily: "Future",
                            fontSize: 30,
                            color: primaryAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height /
                          hei(context, 20)),
                  CustomTextField(
                      hintText: "Email",
                      icon: Icons.mail,
                      onChanged: (value) {},
                      con: email),
                  CustomTextField(
                      obscureText: true,
                      hintText: "Password",
                      icon: Icons.password,
                      onChanged: (value) {
                        if (email.text.isNotEmpty && value.isNotEmpty) {
                          setState(() {
                            color = true;
                          });
                        } else {
                          setState(() {
                            color = false;
                          });
                        }
                      },
                      con: password),
                  InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (color) {
                        setState(() {
                          disploading = true;
                        });
                        final s = await login(ref, context);
                        if (s) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              SlidePageRoute.create( Homepage()),
                              (route) => false);
                        } else {
                          setState(() {
                            disploading = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color ? primaryBgcolor : Colors.grey),
                      alignment: Alignment.center,
                      height:
                          MediaQuery.of(context).size.height / hei(context, 50),
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(right: 20, left: 20, top: 7),
                      child: ResponsiveText(
                        text: "Login",
                        style: const TextStyle(
                            fontFamily: "SF",
                            color: Colors.white,
                            fontSize: 16.5),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height /
                          hei(context, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ResponsiveText(
                        textAlign: TextAlign.center,
                        text: "Don't have an Account ?",
                        style: const TextStyle(
                            fontFamily: "SF",
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context,
                              SlidePageRoute.create(const RegisterPage()));
                        },
                        child: ResponsiveText(
                          textAlign: TextAlign.center,
                          text: " Register",
                          style: const TextStyle(
                              fontFamily: "SF",
                              fontSize: 15,
                              color: primaryAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
              disploading ? const Loading() : Container(),
            ]),
          );
  }
}
