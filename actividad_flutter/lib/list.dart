import 'package:flutter/material.dart';
import 'languages.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lenguajes de programación"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: lenguajes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(lenguajes[index]['icon'], color: Colors.purple),
            title: Text(lenguajes[index]['name']),
            trailing: index == _selectedIndex
                ? const Icon(Icons.check_circle, color: Colors.purple)
                : null,
            selected: index == _selectedIndex,
            selectedTileColor: Colors.purple.withOpacity(0.2),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
