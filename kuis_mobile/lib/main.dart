import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'stationery_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Alat Tulis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTab = 0;
  List<StationeryItem> stationeryItems = StationeryItem.sampleData;

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    if (selectedTab == 0) {
      currentPage = HomePage(stationeryItems: stationeryItems);
    } else {
      currentPage = ProfilePage(stationeryItems: stationeryItems);
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Barang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
