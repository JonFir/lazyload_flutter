import 'package:flutter/material.dart';

class MainNavigation {
  static void showLoader(BuildContext context) =>
      Navigator.of(context).pushNamedAndRemoveUntil('loader', (_) => false);
}
