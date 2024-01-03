import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/components/itemdisp.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';

class LikedItems extends ConsumerStatefulWidget {
  const LikedItems({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikedItemsState();
}

class _LikedItemsState extends ConsumerState<LikedItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
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
          title: ResponsiveText(
            text: "Liked Products",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: "SF",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: ref.watch(likedItemsProvider).when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return AnimationLimiter(
                        child: MasonryGridView.builder(
                            itemCount: data.length,
                            gridDelegate:
                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: ((context, index) =>
                                AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    columnCount: data.length,
                                    duration: const Duration(milliseconds: 400),
                                    child: ScaleAnimation(
                                        child: DispItem(
                                            data: data,
                                            index: index,
                                            minus: 0))))));
                  } else {
                    return ResponsiveText(
                      text: "No Items Found",
                      style: const TextStyle(
                          fontFamily: "SF", fontSize: 20, color: Colors.black),
                    );
                  }
                },
                error: (er, st) {
                  return const Icon(
                    Icons.error,
                    size: 26,
                  );
                },
                loading: () => const Loading())));
  }
}
