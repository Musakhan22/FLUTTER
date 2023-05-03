import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 15,
          offset: const Offset(0, 0.5),
        )
      ]),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/svg/homepage.svg', color: Colors.black)
                : SvgPicture.asset('assets/svg/homepage.svg',color: Colors.grey),
                label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/svg/like.svg', color: Colors.black)
                : SvgPicture.asset('assets/svg/like.svg',color: Colors.grey),
                label: 'Heart',
            ),
            BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/svg/addnew.svg',color: Colors.black,)
                : SvgPicture.asset('assets/svg/addnew.svg',color: Colors.grey),
                label: 'Plus',
            ),
            BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/svg/notification.svg', color: Colors.black)
                : SvgPicture.asset('assets/svg/notification.svg',color: Colors.grey),
                label: 'Message',
            ),
            BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? SvgPicture.asset('assets/svg/user.svg', color: Colors.black)
                : SvgPicture.asset('assets/svg/user.svg',color: Colors.grey),
                label: 'User',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
         _onItemTapped;
        },
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}
