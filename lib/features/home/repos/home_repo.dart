import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kloth/core/failure.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/core/type_def.dart';
import 'package:kloth/features/home/model/item_model.dart';

final homeRepoProvider =
    Provider((ref) => HomeRepo(cdio: ref.watch(dioProvider), cref: ref));

class HomeRepo {
  final Dio dio;
  final ProviderRef ref;

  HomeRepo({required Dio cdio, required ProviderRef cref})
      : dio = cdio,
        ref = cref;

  Future<List<Items>> getitems() async {
    dio.options.headers['jwt'] = await ref.watch(stringToken.future);
    var response =
        await dio.get("https://zealous-lamb-garment.cyclic.app/items/all");
    final s = (response.data as List).map((e) => Items.fromJson(e)).toList();
    return s;
  }
}