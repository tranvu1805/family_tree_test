import 'package:family_tree_test/view/home/widgets/item_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  static final widgets = <Widget>[
    const ItemHome(
      name: 'abc',
      gender: '1',
      member: '1',
      date: '12/11/2024',
      author: 'Trần Vũ',
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Sự kiện',
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Bài Viết',
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Tài khoản',
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gia Phả'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? const TextStyle(color: Colors.blue)
                : const TextStyle(color: Colors.black),
          ),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: Colors.blue);
              }
              return const IconThemeData(color: Colors.black);
            },
          ),
          indicatorColor: Colors.transparent,
          indicatorShape:
              const CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.groups),
              label: 'Gia phả',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.event),
              ),
              label: 'Sự Kiện',
            ),
            NavigationDestination(
              icon: Icon(Icons.post_add),
              label: 'Bài viết',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
      body: widgets[currentPageIndex],
    );
  }
}
