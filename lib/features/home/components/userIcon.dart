import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/utlis/color.dart';

class UserIcon extends ConsumerStatefulWidget {
  const UserIcon({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserIconState();
}

class _UserIconState extends ConsumerState<UserIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize:43,
      splashRadius: 1,
      onPressed: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        
                        children: [
                          Container(
                            
                            margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height/hei(context, 50),
                            width: MediaQuery.of(context).size.width/wid(context, 50),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>Image.asset("assets/images/user.png") ,
                                  imageUrl: "https://i.ibb.co/NWbm4N6/user.png",
                                  placeholder: (context, url) =>
                                      Image.asset("assets/images/user.png"),
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ResponsiveText(
                                  textAlign: TextAlign.left,
                                  text: "username",
                                  style: const TextStyle(
                                      fontFamily: "SF",
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ResponsiveText(
                                  textAlign: TextAlign.left,
                                  text: "useremail",
                                  style: const TextStyle(
                                      fontFamily: "SF",
                                      color: Colors.black54,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),InkWell(
                        onTap: () {
                          
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              left: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              top: MediaQuery.of(context).size.height /
                                  hei(context, 15),
                            ),
                            height: MediaQuery.of(context).size.height /
                                hei(context, 50),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: dialogItemColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18)
                                )),
                            child: ResponsiveText(
                              text: "About",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SF",
                                  fontSize: 15),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              left: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              top: MediaQuery.of(context).size.height /
                                  hei(context, 5),
                            ),
                            height: MediaQuery.of(context).size.height /
                                hei(context, 50),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: dialogItemColor,
                                ),
                            child: ResponsiveText(
                              text: "Settings",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SF",
                                  fontSize: 15),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              left: MediaQuery.of(context).size.width /
                                  wid(context, 25),
                              top: MediaQuery.of(context).size.height /
                                  hei(context, 5),
                            ),
                            height: MediaQuery.of(context).size.height /
                                hei(context, 50),
                            alignment: Alignment.center,
                            decoration:const BoxDecoration(
                                color: dialogItemColor,
                                borderRadius:  BorderRadius.only(
                                  bottomLeft: Radius.circular(18),
                                  bottomRight: Radius.circular(18)
                                )),
                            child: ResponsiveText(
                              text: "Sign Out",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SF",
                                  fontSize: 15),
                            )),
                      ),
                    ],
                  )
                ],
              );
            });
      },
      icon: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            errorWidget: (context, url, error) =>Image.asset("assets/images/user.png") ,
            imageUrl: "https://i.ibb.co/NWbm4N6/user.png",
            placeholder: (context, url) =>
                Image.asset("assets/images/user.png"),
          )),
    );
  }
}
