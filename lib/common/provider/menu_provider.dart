import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuNotifier extends StateNotifier<int> {
  MenuNotifier() : super(0);

  void onMenuChanged(int menu) => state = menu;
}

final menuProvider = StateNotifierProvider<MenuNotifier, int>((ref) {
  return MenuNotifier();
});
