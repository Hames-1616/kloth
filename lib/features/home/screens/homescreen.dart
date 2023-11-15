import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return Scaffold(
        body: Center(
      child: MasonryGridView(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Container(
            height: 50,
            child: Text(
              "hey there",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.black),
          )
        ],
      ),
    ));
  }
}
