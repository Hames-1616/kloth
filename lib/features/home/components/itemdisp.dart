import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/dimensions.dart';
import 'package:kloth/core/responsive_text.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
import 'package:kloth/features/home/model/item_model.dart';
import 'package:kloth/features/home/screens/ItemScreen.dart';
import 'package:kloth/utlis/color.dart';
import 'package:like_button/like_button.dart';

class DispItem extends ConsumerStatefulWidget {
  final List<Items> data;
  final int index;
  final int minus;
  const DispItem(
      {super.key,
      required this.data,
      required this.index,
      required this.minus});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DispItemState();
}

class _DispItemState extends ConsumerState<DispItem> {
  Future<bool> like(bool liked) {
    final name = widget.data[widget.index - widget.minus].name;
    return liked == false
        ? ref.watch(homeControllerProvider.notifier).likeditem(name!)
        : ref.watch(homeControllerProvider.notifier).dislikeditem(name!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          ref
              .read(homeControllerProvider.notifier)
              .caroimages(widget.data[widget.index - widget.minus].name ?? "");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                        data: widget.data[widget.index - widget.minus],
                      )));
        },
        child: Column(
          children: [
            ref
                .watch(imageProvider(
                    widget.data[widget.index - widget.minus].name ?? ""))
                .when(
                    data: (data) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height /
                            hei(context, 150),
                        child: CachedNetworkImage(
                          imageUrl: data,
                          progressIndicatorBuilder: (context, url, progress) =>
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
                          height: MediaQuery.of(context).size.height /
                              hei(context, 150),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: primaryAccent,
                          )),
                        )),
            Container(
              margin: const EdgeInsets.only(
                  right: 15, left: 15, top: 15, bottom: 5),
              alignment: Alignment.centerLeft,
              child: ResponsiveText(
                text: (widget.data[widget.index - widget.minus].name)!
                    .replaceAll("_", " "),
                style: const TextStyle(
                    fontFamily: "SF",
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveText(
                    text: "₹${widget.data[widget.index - widget.minus].price}",
                    style: const TextStyle(
                        fontFamily: "SF",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  LikeButton(
                    isLiked: widget.data[widget.index - widget.minus].liked,
                    onTap: like,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
