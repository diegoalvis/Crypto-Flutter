import 'package:flutter/cupertino.dart';

abstract class ViewModel<T extends ViewStatus> with ChangeNotifier {
  late T _status;

  late ErrorEvent _event;

  set event(ErrorEvent value) {
    _event = value;
    notifyListeners();
  }

  T get status => _status;

  set status(T value) {
    _status = value;
    notifyListeners();
  }
}

abstract class ViewStatus {}

class ErrorEvent {
  final String message;

  ErrorEvent(this.message);
}
