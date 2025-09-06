import 'package:flutter/material.dart';
import 'languages.dart'; // misma lista compartida

class AlternativeView extends StatefulWidget {
  const AlternativeView({super.key});

  @override
  State<AlternativeView> createState() => _AlternativeViewState();
}

class _AlternativeViewState extends State<AlternativeView> {
  int _selectedIndex = -1;
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lenguajes.length,
      itemBuilder: (context, index) {
        final lang = lenguajes[index];
        final isSelected = index == _selectedIndex;
        final isHovered = index == _hoveredIndex;

        return MouseRegion(
          onEnter: (_) => setState(() => _hoveredIndex = index),
          onExit: (_) => setState(() => _hoveredIndex = -1),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Card(
              color: isSelected
                  ? const Color.fromARGB(255, 218, 152, 230).withOpacity(0.2)
                  : isHovered
                  ? const Color.fromARGB(255, 124, 9, 145).withOpacity(0.1)
                  : null,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected
                      ? const Color.fromARGB(255, 246, 245, 247)
                      : const Color.fromARGB(255, 186, 4, 231),
                  width: isSelected ? 2 : 1,
                ),
              ),
              elevation: isHovered ? 6 : 2,
              child: ListTile(
                leading: Icon(
                  lang['icon'],
                  color: isSelected ? Colors.purple : Colors.grey[800],
                  size: 32,
                ),
                title: Text(
                  lang['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.purple : Colors.black,
                  ),
                ),
                subtitle: Text(lang['description']),
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: Colors.purple)
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
