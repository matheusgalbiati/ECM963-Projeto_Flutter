import 'package:flutter/material.dart';
import 'package:imdb/pages/movies_page.dart';
import 'package:imdb/pages/people_page.dart';
import 'package:imdb/pages/search_page.dart';
import 'package:imdb/shared/app_theme.dart';
import 'package:imdb/pages/tv_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int currentPageIndex = 0;
  String selectedOption = 'Filmes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: switchPage(index: currentPageIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisa'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pessoas'),
        ],
      ),
    );
  }

  switchPage({int index = 0}) {
    switch (index) {
      case 0:
        return const SearchPage();
      case 1:
        return const MoviesPage();
      case 2:
        return const TvPage();
      case 3:
        return const PeoplePage();
    }
  }

}
