import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: ref.watch(allItemsProvider).when(
                data: (data) {
                  return MasonryGridView.builder(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: data.length+1,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        if (index == 0){
                          return Container(
                            color: Colors.grey,
                            alignment: Alignment.center,
                            height: 40,
                            child: Text("Found ${data.length} items"),
                          );
                        } else {
                          return Container(
                            height: 100,
                            color: Colors.pink,
                            alignment: Alignment.center,
                            child: Text(data[index-1].name ?? "none"),
                          );
                        }
                      });
                },
                error: (error, st) {
                  return const Icon(
                    Icons.error,
                    size: 26,
                  );
                },
                loading: () => const Loading())));
  }
}
