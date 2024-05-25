import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/screens/favorite/favorite_screen.dart';
import 'package:nongkuy/screens/home/home_screen.dart';
import 'package:nongkuy/screens/search/search_screen.dart';

part '../constrollers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(
      CustomBottomNavigationBarController(),
    );
    return Scaffold(
      body: Obx(() {
        final controller = Get.find<CustomBottomNavigationBarController>();
        return IndexedStack(
          index: controller.currentIndex.value,
          children: [
            const HomeScreen(),
            SearchScreen(),
            FavoriteScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        final controller = Get.find<CustomBottomNavigationBarController>();
        return BottomNavigationBar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary,
          currentIndex: controller.currentIndex.value,
          onTap: (
            index,
          ) {
            controller.setCurrentIndex(
              index,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Theme.of(
                  context,
                ).colorScheme.outlineVariant,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                color: Theme.of(
                  context,
                ).colorScheme.outlineVariant,
              ),
              label: 'Search',
              activeIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_rounded,
                color: Theme.of(
                  context,
                ).colorScheme.outlineVariant,
              ),
              label: 'Favorite',
              activeIcon: Icon(
                Icons.favorite_rounded,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary,
              ),
            ),
          ],
          selectedItemColor: Theme.of(
            context,
          ).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(
            context,
          ).colorScheme.outlineVariant,
        );
      }),
    );
  }
}
