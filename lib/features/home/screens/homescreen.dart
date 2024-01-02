import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/components/itemdisp.dart';
import 'package:kloth/features/home/components/userIcon.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
import 'package:kloth/features/home/screens/searchScreen.dart';
import 'package:kloth/utlis/color.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height / hei(context, 60),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UserIcon(),
                      ResponsiveText(
                        text: "Products",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "SF",
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: 
                                Image.asset("assets/images/heart.png"),
                            color: Colors.black,
                            onPressed: () {
                              
                            },
                          ),
                          IconButton(
                            icon: Hero(
                                tag: "search",
                                child: Image.asset("assets/images/search.png")),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: RefreshIndicator(
          color: primaryAccent,
          onRefresh: () => ref.refresh(allItemsProvider.future),
          child: Center(
              child: ref.watch(allItemsProvider).when(
                  data: (data) {
                    return AnimationLimiter(
                      child: MasonryGridView.builder(
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
                              return AnimationConfiguration.staggeredGrid(
                                columnCount: data.length,
                                position: index - 1,
                                duration: const Duration(milliseconds: 400),
                                child: ScaleAnimation(
                                    child: DispItem(
                                  data: data,
                                  index: index,
                                  minus: 1,
                                )),
                              );
                            }
                          }),
                    );
                  },
                  error: (error, st) {
                    return const Icon(
                      Icons.error,
                      size: 26,
                    );
                  },
                  loading: () => const Loading())),
        ));
  }
}
