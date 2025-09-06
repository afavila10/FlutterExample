import 'package:flutter/material.dart';
import 'list.dart';

class DrawerMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const DrawerMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Business'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('School'),
            selected: selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_sidebar),
            title: const Text('Alternative view'),
            selected: selectedIndex == 3,
            onTap: () {
              onItemTapped(3);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Lenguajes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LanguagesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
