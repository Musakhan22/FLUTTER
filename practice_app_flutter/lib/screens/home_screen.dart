import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/categories_item.dart';
import '../models/popular_items.dart';
import '../models/recommended_items.dart';
import '../widgets/custom_tab_indicator.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(
    viewportFraction: 0.877,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 57,
                margin: const EdgeInsets.only(
                  top: 28,
                  left: 28,
                  right: 28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: SvgPicture.asset('assets/svg/drawer.svg'),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/search.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 25),
                child: Text(
                  'Explore\nthe Nature',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: const EdgeInsets.only(left: 14, top: 20),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 15, right: 15),
                    indicatorPadding:
                        const EdgeInsets.only(left: 14, right: 14),
                    isScrollable: true,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[200],
                    labelStyle: GoogleFonts.lato(
                        fontSize: 13, fontWeight: FontWeight.w500),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 13, fontWeight: FontWeight.w500),
                    indicator: RoundedRectangleTabIndicator(
                      color: Colors.black,
                      weight: 2.4,
                      width: 19,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          child: const Text('Recommended'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: const Text('Popular'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: const Text('New Destination'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: const Text('Hidden'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                        right: 28,
                      ),
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                            image: NetworkImage(recommendations[index].image),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 19.2,
                                  sigmaX: 19.2,
                                ),
                                child: Container(
                                  height: 38,
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/pin.svg',
                                        color: Colors.white,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        recommendations[index].name,
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 28),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color.fromARGB(255, 87, 87, 87),
                    dotColor: Color.fromARGB(255, 193, 193, 193),
                    dotHeight: 4.7,
                    dotWidth: 5,
                    spacing: 4.7,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 43, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Show All',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 33,
                ),
                height: 48,
                child: ListView.builder(
                  itemCount: popitem.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 28,
                    right: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 19),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(popitem[index].color)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            popitem[index].image,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            popitem[index].name,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 16,
                ),
                height: 120,
                child: ListView.builder(
                  itemCount: catItem.length,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 12,
                  ),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(catItem[index].image),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
