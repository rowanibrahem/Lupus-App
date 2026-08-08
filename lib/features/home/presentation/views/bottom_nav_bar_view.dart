import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/asset_icons.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/home/presentation/views/home_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    const Center(child: Text("Search")),
    const Center(child: Text("Notifications")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.transparent,
      body: _screens[_currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          color: Colors.transparent,
          child: CurvedNavigationBar(
            index: _currentIndex,
            height: 60,
            backgroundColor: Colors.transparent,
            color: AppColors.primaryColor,
            buttonBackgroundColor: AppColors.bgColor,
            animationDuration: const Duration(milliseconds: 300),
            items: [
              Icon(Icons.home, color: Colors.white),
              SvgPicture.asset(
                AssetIcons.support,
                // height: 25,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              SvgPicture.asset(
                AssetIcons.medicine,
                // height: 25,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Icon(Icons.person, color: Colors.white),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
