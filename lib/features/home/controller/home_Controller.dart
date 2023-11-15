import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/features/home/model/item_model.dart';
import 'package:kloth/features/home/repos/home_repo.dart';

final allItemsProvider = FutureProvider((ref) => ref.watch(homeControllerProvider.notifier).getallitems());

final homeControllerProvider = StateNotifierProvider<HomeController, bool>(
    (ref) => HomeController(chrepo: ref.watch(homeRepoProvider)));

class HomeController extends StateNotifier<bool> {
  final HomeRepo hrepo;

  HomeController({required HomeRepo chrepo})
      : hrepo = chrepo,
        super(false);

  Future<List<Items>>getallitems() async {
    return await hrepo.getitems();
  }
}
