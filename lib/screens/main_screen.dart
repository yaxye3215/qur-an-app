import 'package:flutter/material.dart';
import 'package:quran_app/screens/surah/surah_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this, initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 233, 235),
      appBar: AppBar(
        backgroundColor: const Color(0xff22909D),
        title: const Text("Quran App"),
        actions: [
          IconButton(
              onPressed: () {
               
              },
              icon: const Icon(Icons.play_arrow))
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Surah",
            ),
            Tab(text: "Juz"),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            SurahScreen(),
            const Text("tab2"),
          ],
        ),
      ),
    );
  }
}
