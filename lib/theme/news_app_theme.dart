import 'package:flutter/material.dart';

ThemeData newsAppTheme(BuildContext context) {
  return ThemeData(
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          titleTextStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontFamily: "PS")),
      fontFamily: "PS",
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xffF2F3F6));
}
