import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
import 'package:kloth/features/home/model/item_model.dart';

class ItemScreen extends ConsumerStatefulWidget {
  final Items data;
  const ItemScreen({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemScreenState();
}

class _ItemScreenState extends ConsumerState<ItemScreen> {

  @override
  Widget build(BuildContext context) {
    return ref.watch(homeControllerProvider)?const Loading():
    Scaffold(
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: CarouselSlider(
                    options: CarouselOptions(),
                    items: ref
                        .watch(imagesProvider)
                        .map((e) => CachedNetworkImage(
                              imageUrl: e,
                              placeholder: (context, url) => const Loading(),
                            ))
                        .toList()),
              ),
            ],
            
          ),
        ));
  }
}
