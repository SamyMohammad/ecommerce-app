
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/features/presentation/home/tabs/categories_tap/screen/categories_tab.dart';
import 'package:ecommerce_app/features/presentation/home/tabs/home_tap/screen/home_tab.dart';
import 'package:ecommerce_app/features/presentation/home/tabs/profile_tab/screen/profile_tab.dart';
import 'package:ecommerce_app/features/presentation/home/tabs/wish_list_tab/screen/wish_list_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = const [HomeTab() , CategoriesTab() , WishListTab() , ProfileTab()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        body: tabs[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => changeSelectedIndex(value),
            backgroundColor: ColorManager.primary,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.white,
            showSelectedLabels: false, // Hide selected item labels
            showUnselectedLabels: false, // Hide unselected item labels
            items: [
              // Build BottomNavigationBarItem widgets for each tab
              buildBottomNavigationBarItem(IconsAssets.icHome, "Home"),
              buildBottomNavigationBarItem(IconsAssets.icCategory, "Category"),
              buildBottomNavigationBarItem(IconsAssets.icWithList, "WishList"),
              buildBottomNavigationBarItem(IconsAssets.icProfile, "Profile"),
            ],
          ),
        ));
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }

  // Helper function to create a BottomNavigationBarItem
  BottomNavigationBarItem buildBottomNavigationBarItem(
      String iconPath, String title) {
    return BottomNavigationBarItem(
        label: title, // Label for accessibility (not displayed)
        activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath ),
              color: ColorManager.primary,// Active icon imagecolor: ColorManager.primary, // Active icon color
            )),
        icon: ImageIcon(
          AssetImage(iconPath), // Inactive icon image
          color: ColorManager.white, // Inactive icon color
        ));
  }
}
