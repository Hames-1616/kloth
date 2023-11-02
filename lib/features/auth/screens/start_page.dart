import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/navigatorAnimation.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/auth/controller/auth_controller.dart';
import 'package:kloth/features/auth/screens/login_page.dart';
import 'package:kloth/utlis/color.dart';
import 'package:kloth/utlis/dimensions.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});



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
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height /
                                hei(context, 10),
                            horizontal: MediaQuery.of(context).size.width /
                                wid(context, 10)),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/5.jpg"),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height /
                                hei(context, 10),
                            horizontal: MediaQuery.of(context).size.width /
                                wid(context, 10)),
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
                onPressed: () {
                  Navigator.push(context, SlidePageRoute.create(login_Page()));
                },
                child: ResponsiveText(
                  text: "Get Started",
                  style: const TextStyle(
                      fontFamily: "SF", color: Colors.white, fontSize: 16.5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
