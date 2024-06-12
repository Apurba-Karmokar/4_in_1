import 'package:flutter/material.dart';
import 'footer.dart';
import 'weather_page.dart';
import 'quizzer_page.dart';
import 'calculator_page.dart';
import 'about_me_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    WeatherPage(),
    QuizzerPage(),
    CalculatorPage(),
    AboutMePage(),
  ];

  final List<String> _pageTitles = [
    "Weather",
    "Quizzer",
    "Scientific Calculator",
    "About Me",
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    Color appBarColor = isDarkMode ? Colors.grey[900]! : Colors.blue;
    Color iconColor = isDarkMode ? Colors.amber[800]! : Colors.amber[800]!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      darkTheme: theme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_pageTitles[_selectedIndex]),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: Footer(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          appBarColor: appBarColor,
          iconColor: iconColor,
        ),
      ),
    );
  }
}
