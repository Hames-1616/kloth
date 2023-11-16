import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
import 'package:kloth/utlis/color.dart';
import 'package:like_button/like_button.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: RefreshIndicator(
      color: primaryAccent,
      onRefresh: () => ref.refresh(allItemsProvider.future),
      child: Center(
          child: ref.watch(allItemsProvider).when(
              data: (data) {
                return MasonryGridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.length + 1,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height /
                              hei(context, 70),
                          child: ResponsiveText(
                            text: "Found ${data.length} Results",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontFamily: "SF",
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: primaryBgcolor),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ref
                                  .watch(
                                      imageProvider(data[index - 1].name ?? ""))
                                  .when(
                                      data: (data) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              hei(context, 150),
                                          child: CachedNetworkImage(
                                            imageUrl: data,
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    const Center(
                                              child: CircularProgressIndicator(
                                                color: primaryAccent,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      error: (e, st) {
                                        return const Icon(Icons.error);
                                      },
                                      loading: () => Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                hei(context, 150),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: primaryAccent,
                                            )),
                                          )),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 15, left: 15, top: 15, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: ResponsiveText(
                                  text: (data[index - 1].name)!
                                      .replaceAll("_", " "),
                                  style: const TextStyle(
                                      fontFamily: "SF",
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ResponsiveText(
                                      text: "₹${data[index - 1].price}",
                                      style: const TextStyle(
                                          fontFamily: "SF",
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const LikeButton()
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    });
              },
              error: (error, st) {
                return Text(error.toString());
                // const Icon(
                //   Icons.error,
                //   size: 26,
                // );
              },
              loading: () => const Loading())),
    ));
  }
}
