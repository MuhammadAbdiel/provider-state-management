import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isBlack = true;

  bool get isBlack => _isBlack;
  set isBlack(bool value) {
    _isBlack = value;
    notifyListeners();
  }

  Color get color => _isBlack ? Colors.black : Colors.grey;
}
