import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/features/home/model/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homeRepoProvider =
    Provider((ref) => HomeRepo(cdio: ref.watch(dioProvider), cref: ref));

class HomeRepo {
  final Dio dio;
  final ProviderRef ref;

  HomeRepo({required Dio cdio, required ProviderRef cref})
      : dio = cdio,
        ref = cref;
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  Future<List<Items>> getitems() async {
    dio.options.headers['jwt'] = await ref.watch(stringToken.future);
    var response =
        await dio.get("https://zealous-lamb-garment.cyclic.app/items/all");
    final s = (response.data as List).map((e) => Items.fromJson(e)).toList();
    return s;
  }

  Future<String> getimg(String name) async {
    var urlref = firebaseStorage.child("$name.png");
    var imgurl = await urlref.getDownloadURL();
    return imgurl;
  }

  void checktoken() async {
    final remember = await SharedPreferences.getInstance();
    final s = remember.getString("token");
    if (s != null) {
      ref.watch(loginscreen.notifier).state = true;
    } else {
      ref.watch(loginscreen.notifier).state = false;
    }
  }

  Future<List<Items>> searchItem(String item) async{
        dio.options.headers['jwt'] = await ref.watch(stringToken.future);
    var response =
        await dio.get("https://zealous-lamb-garment.cyclic.app/items/list/$item");
    final s = (response.data as List).map((e) => Items.fromJson(e)).toList();
    return s;
  }
}
