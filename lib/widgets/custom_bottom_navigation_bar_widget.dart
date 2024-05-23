import 'package:flutter/material.dart';
import 'package:nongkuy/screens/home/home_screen.dart';

class CustomBottomNavigationBarWidget extends StatefulWidget {
  const CustomBottomNavigationBarWidget({super.key});

  @override
  CustomBottomNavigationBarWidgetState createState() =>
      CustomBottomNavigationBarWidgetState();
}

class CustomBottomNavigationBarWidgetState
    extends State<CustomBottomNavigationBarWidget> {
  int _currentIndex = 0;

  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _currentIndex,
        onTap: (index) {
          _setCurrentIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_add_rounded,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            label: 'Bookmark',
            activeIcon: Icon(
              Icons.bookmark_add_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}
