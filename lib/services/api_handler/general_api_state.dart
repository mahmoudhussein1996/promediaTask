
 import 'package:flutter/material.dart';

class GeneralApiState extends ChangeNotifier{
  String error;
  bool hasData, hasError, isWaiting, connectionError;

  GeneralApiState
      ({
    this.error="",
    this.hasError=false,
    this.hasData = false,
    this.isWaiting = false,
    this.connectionError = false
  });

  @override
  String toString() {
    return "{error: $error, hasData: $hasData,hasError: $hasError, isWaiting: $isWaiting, connectionError: $connectionError,}";
  }

  setError(dynamic err) {
    error = err.toString();
  }

  setWaiting() {
    error='';
    isWaiting = true;
    hasData = false;
    hasError = false;
    connectionError = false;
    listen();
  }


 setHasData(){
   isWaiting = false;
   hasData = true;
   hasError = false;
   connectionError = false;
   listen();
 }

  setHasError() {
    isWaiting = false;
    hasData = false;
    hasError = true;
    connectionError = false;
    listen();
  }


  setConnectionError() {
    isWaiting = false;
    hasData = false;
    hasError = false;
    connectionError = true;
    listen();
  }

  setDismissWaiting() {
    isWaiting = false;
    hasData = false;
    hasError = false;
    connectionError = false;
    listen();
  }


  listen(){
    notifyListeners();
  }

 }
