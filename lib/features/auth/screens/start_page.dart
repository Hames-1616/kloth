import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/features/auth/controller/auth_controller.dart';
import 'package:kloth/utlis/color.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  void signInGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/5.jpg"),
                        )),
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/1.jpg"),
                        )),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          //  width: 140,
                          margin: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/2.jpg"),
                          )),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/3.jpg"),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 45, left: 45),
                padding: const EdgeInsets.all(20),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Let's Create Your ",
                      style: TextStyle(
                          fontFamily: "future",
                          fontSize: 30,
                          color: Colors.black)),
                  TextSpan(
                      text: "Style",
                      style: TextStyle(
                          fontFamily: "future",
                          fontSize: 30,
                          color: primaryAccent)),
                  TextSpan(
                      text: " With Fashion",
                      style: TextStyle(
                          fontFamily: "future",
                          fontSize: 30,
                          color: Colors.black)),
                ]))),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryBgcolor),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 20, left: 20, top: 7),
              child: TextButton(
                onPressed: () => signInGoogle(ref),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontFamily: "SF", color: Colors.white, fontSize: 16.5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an Account? ",
                  style: TextStyle(fontFamily: "SF", fontSize: 14.5),
                ),
                InkWell(
                  focusColor: Colors.transparent,
                  onTap: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "SF", color: primaryAccent, fontSize: 14.5),
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
