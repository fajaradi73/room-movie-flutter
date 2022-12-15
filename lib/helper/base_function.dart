import 'package:get/get.dart';

extension BaseExBool on RxBool {
  void toogle() {
    if ((this).value == true) {
      (this)(false);
    } else {
      (this)(true);
    }
  }
}

extension BaseExList on RxList {
  void rxClear() {
    (this).clear();
    (this).refresh();
  }

  void rxAdd(dynamic val) {
    (this).add(val);
    (this).refresh();
  }

  void rxNew(List<dynamic>? val) {
    if (val != null) {
      (this)(val);
    } else {
      (this)([]);
    }
    (this).refresh();
  }

  void rxAddAll(List<dynamic>? val) {
    if (val != null) {
      (this).addAll(val);
    } else {
      (this)([]);
    }
    (this).refresh();
  }

  void rxRemove(dynamic val) {
    (this).remove(val);
    (this).refresh();
  }

  void rxRemoveAt(int val) {
    (this).removeAt(val);
    (this).refresh();
  }
}
