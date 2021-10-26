import 'package:flutter/cupertino.dart';


abstract class ViewModel<T extends ViewStatus> with ChangeNotifier {

  late T _status;

  T get status => _status;

  set status(T value) {
    _status = value;
    notifyListeners();
  }
}

abstract class ViewStatus {

}

