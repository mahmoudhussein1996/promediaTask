import 'package:flutter/material.dart';

abstract class GeneralBlocState<T> with ChangeNotifier {
  T data;
  String error;
  bool hasData, hasError, waiting;

  GeneralBlocState
      ({
     required this.data,
     required this.error,
    this.hasData = false,
    this.hasError = false,
    this.waiting = true
  });

  @override
  String toString() {
    return "{data: $data, error: $error, hasData: $hasData,hasError: $hasError, isWaiting: $waiting}";
  }

  setError(String err) {
    error = err;
  }

  setWaiting() {
    waiting = true;
    hasData = false;
    notifyListeners();
  }

  dismissWaitingWithError() {
    waiting = false;
    hasData = false;
    notifyListeners();
  }

  dismissWaiting() {
    waiting = false;
    hasData = true;
    notifyListeners();
  }
}
