import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
import 'package:kloth/features/home/model/item_model.dart';
import 'package:kloth/utlis/color.dart';

class ItemScreen extends ConsumerStatefulWidget {
  final Items data;
  const ItemScreen({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemScreenState();
}

class _ItemScreenState extends ConsumerState<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(homeControllerProvider)
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
                splashRadius: 0.1,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              actions: [
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashRadius: 0.1,
                      icon: const Icon(Icons.shopping_cart_rounded),
                      color: Colors.black,
                      onPressed: () {},
                    ))
              ],
            ),
            body: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: ImageSlideshow(
                            autoPlayInterval: 3000,
                            isLoop: true,
                            height: MediaQuery.of(context).size.height /
                                hei(context, 250),
                            indicatorColor: primaryAccent,
                            indicatorBackgroundColor: Colors.grey.shade300,
                            children: ref
                                .watch(imagesProvider)
                                .map((e) => Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: CachedNetworkImage(
                                        imageUrl: e,
                                        placeholder: (context, url) =>
                                            const Loading(),
                                      ),
                                    ))
                                .toList())),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ResponsiveText(
                        text: widget.data.name!.replaceFirst("_", " "),
                        style: const TextStyle(
                            fontFamily: "SF",
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: ResponsiveText(
                        text:
                            "5 adjustable DPI levels (500, 1000, 2000, 3000, 5000) meet your multiple needs, either for daily work or gaming, DPI can be adjusted freely by plus/minus 100 from 100 to 10000, taking advantage of on-the-fly DPI switching to instantly match mouse speed to gameplay demands;Besides, the mouse point Speed setting in the software also allows you to mildly change the movement speed of the mouse to achieve the best fit mode for yourself",
                        style: const TextStyle(
                          fontFamily: "SF",
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(
                children: [
                 const SizedBox(height: 40,),
                  Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.height),
                        Icon(Icons.sanitizer),
                        Icon(Icons.health_and_safety)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
