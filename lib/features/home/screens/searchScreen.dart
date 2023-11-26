import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/components/itemdisp.dart';
import 'package:kloth/features/home/components/searchbar.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        actions: [
          Container(
              padding: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: SearchItem(
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  con: searchController))
        ],
      ),
      body: Center(
        child: searchController.text == ""
            ? ResponsiveText(
                text: "Search an Item",
                style: const TextStyle(
                    fontFamily: "SF", fontSize: 20, color: Colors.black),
              )
            : ref.watch(searchitemProvider(searchController.text)).when(
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
                loading: () => const Loading()),
      ),
    );
  }
}
