import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexProviderListener extends StateNotifier<int> {
  IndexProviderListener() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}

final indexProvider = StateNotifierProvider<IndexProviderListener, int>((ref) {
  return IndexProviderListener();
});
