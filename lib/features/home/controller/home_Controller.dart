import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/features/home/model/item_model.dart';
import 'package:kloth/features/home/repos/home_repo.dart';


final searchitemProvider = FutureProvider.family((ref, String item) =>
    ref.watch(homeControllerProvider.notifier).getitem(item));

final imageProvider = FutureProvider.family((ref, String name) =>
    ref.watch(homeControllerProvider.notifier).getimg(name));

final allItemsProvider = FutureProvider(
    (ref) => ref.watch(homeControllerProvider.notifier).getallitems());

final homeControllerProvider = StateNotifierProvider<HomeController, bool>(
    (ref) => HomeController(chrepo: ref.watch(homeRepoProvider), cref: ref));

class HomeController extends StateNotifier<bool> {
  final HomeRepo hrepo;
  final StateNotifierProviderRef ref;
  HomeController(
      {required HomeRepo chrepo, required StateNotifierProviderRef cref})
      : hrepo = chrepo,
        ref = cref,
        super(false);

  Future<List<Items>> getallitems() async {
    return await hrepo.getitems();
  }

  Future<String> getimg(String name) async {
    return await hrepo.getimg(name);
  }

  void checkToken() {
    hrepo.checktoken();
  }

  Future<List<Items>> getitem(String item) async {
    return await hrepo.searchItem(item);
  }

  void caroimages(String name) async {
    state = true;
    ref.watch(imagesProvider.notifier).state.addAll(await hrepo.getimgs(name));
    state = false;
  }
}
