import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/custom_textfield.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/navigatorAnimation.dart';
import 'package:kloth/core/providers.dart';

import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/auth/controller/auth_controller.dart';
import 'package:kloth/features/auth/screens/login_page.dart';
import 'package:kloth/utlis/color.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  Future<bool> createAccount() {
    final s = ref
        .read(authControllerProvider.notifier)
        .createAccount(name.text, email.text, password.text, context);
    return s;
  }

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  String cpass = "";
   final GlobalKey<FormState> register =
      GlobalKey<FormState>(debugLabel: "registerkey");
  @override
  Widget build(BuildContext context) {
    return ref.watch(authControllerProvider)
        ? const Loading()
        : Scaffold(
            body: Form(
              key: register,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 200),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/registercover.png"),
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
                        text: "Up",
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
                      hintText: "Name",
                      icon: Icons.person,
                      onChanged: (value) {},
                      con: name),
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
                        setState(() {
                          cpass = value;
                        });
                      },
                      con: password),
                  CustomTextField(
                      obscureText: true,
                      conf: cpass,
                      hintText: "Confirm Password",
                      icon: Icons.password_rounded,
                      onChanged: (value) {},
                      con: cpassword),
                  InkWell(
                    onTap: () async {
                          if (register.currentState!.validate()) {
                            final s = await createAccount();
                            if (s) {
                              name.clear();
                              email.clear();
                              password.clear();
                              cpassword.clear();
                  
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(context, SlidePageRoute.create(const login_Page()));
                            }
                          }
                        },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryBgcolor),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height/hei(context, 50),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 20, left: 20, top: 7),
                      child:  ResponsiveText(
                          text: "Register",
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
                        text: "Already have an Account ?",
                        style: const TextStyle(
                            fontFamily: "SF",
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ResponsiveText(
                          textAlign: TextAlign.center,
                          text: " Login",
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
            ),
          );
  }
}
