import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/custom_textfield.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/auth/screens/resgister_page.dart';
import 'package:kloth/utlis/color.dart';

class login_Page extends ConsumerWidget {
  login_Page({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Form(
        key: ref.watch(keyring),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / hei(context, 200),
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/logincover.png"),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / hei(context, 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResponsiveText(
                  text: "Sign ",
                  style: const TextStyle(
                      fontFamily: "Future", fontSize: 30, color: Colors.black),
                ),
                ResponsiveText(
                  text: "In",
                  style: const TextStyle(
                      fontFamily: "Future", fontSize: 30, color: primaryAccent),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / hei(context, 20)),
            CustomTextField(
                hintText: "Email",
                icon: Icons.mail,
                onChanged: (value) {},
                con: email),
            CustomTextField(
                obscureText: true,
                hintText: "Password",
                icon: Icons.password,
                onChanged: (value) {},
                con: password),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: primaryBgcolor),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 20, left: 20, top: 7),
              child: TextButton(
                onPressed: () {
                  if(ref.watch(keyring).currentState!.validate()){
                    
                  }
                },
                child: ResponsiveText(
                  text: "Login",
                  style: const TextStyle(
                      fontFamily: "SF", color: Colors.white, fontSize: 16.5),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / hei(context, 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResponsiveText(
                  textAlign: TextAlign.center,
                  text: "Don't have an Account ?",
                  style: const TextStyle(
                      fontFamily: "SF", fontSize: 15, color: Colors.black),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },
                  child: ResponsiveText(
                    textAlign: TextAlign.center,
                    text: " Register",
                    style: const TextStyle(
                        fontFamily: "SF", fontSize: 15, color: primaryAccent),
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
