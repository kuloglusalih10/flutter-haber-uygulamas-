import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/pages/news_pages.dart';
import 'package:haber_uygulamasi/view_model/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      theme: ThemeData.dark(),

      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: const NewsPage(),
      ),

    );
  }
}