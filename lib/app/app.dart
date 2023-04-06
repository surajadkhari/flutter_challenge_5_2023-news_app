import 'package:flutter/material.dart';

import '../features/home/presentation/dashboard.dart';
import '../theme/news_app_theme.dart';

class Newapp extends StatelessWidget {
  const Newapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: newsAppTheme(context),
      home: const Dashboard(),
    );
  }
}
