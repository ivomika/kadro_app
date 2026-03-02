import 'package:flutter/material.dart';

class MainAppLayout extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTapNavigation;
  final Widget body;

  const MainAppLayout({
    super.key,
    required this.currentIndex,
    required this.onTapNavigation,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: onTapNavigation,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Поиск'
            ),
            NavigationDestination(
                icon: Icon(Icons.history),
                label: 'История'
            ),
          ]
      ),
    );
  }
}
