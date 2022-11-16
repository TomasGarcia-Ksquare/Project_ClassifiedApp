import 'package:flutter/material.dart';

class AlertManager {
  displaySnackbar(context, message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
