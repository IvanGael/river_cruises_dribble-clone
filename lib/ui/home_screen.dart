import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/images.dart';
import 'package:river_cruises_dribble/ui/help_view.dart';
import 'package:river_cruises_dribble/ui/profile_view.dart';
import 'package:river_cruises_dribble/ui/tickets_view.dart';

import '../constants/colors.dart';
import 'favorite_view.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  bool _isBottomNavVisible = false;

  double _boatHeight = 280.0;
  double _boatWidth = 100.0;
  final double _initialBoatTopPosition = 520.0;

  double _glassesHeight = 120.0;
  double _glassesWidth = 120.0;
  final double _initialGlassesTopPosition = 300.0;
  double _glassesLeftPosition = 130.0;

  int _selectedBottomNavigatorItemIndex = 0;

  List<Widget> views = [
    const HomeBody(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox()
    // const FavoriteView(),
    // const TicketsView(),
    // const HelpView(),
    // const ProfileView()
  ];
  

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // BottomNavigationBar display logic
    if (_scrollController.position.atEdge) {
      bool isBottom = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      if (isBottom && !_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = true;
        });
      } else if (!isBottom && _isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = false;
        });
      }
    } else if (_isBottomNavVisible) {
      setState(() {
        _isBottomNavVisible = false;
      });
    }

    double offset = _scrollController.offset;

    // Boat size adjusting logic based on scroll offset
    setState(() {
      if (offset < _initialBoatTopPosition) {
        double newHeight = 260 - (offset / 5);
        double newWidth = 90 - (offset / 14);
        _boatHeight = newHeight > 0 ? newHeight : 0;
        _boatWidth = newWidth > 0 ? newWidth : 0;
      }
    });

    // Glasses size and position adjusting logic based on scroll offset
    setState(() {
      if (offset < _initialGlassesTopPosition) {
        double newHeight = 120 - (offset / 5);
        double newWidth = 120 - (offset / 5);
        _glassesHeight = newHeight > 0 ? newHeight : 0;
        _glassesWidth = newWidth > 0 ? newWidth : 0;
        _glassesLeftPosition = 130 - (offset / 2);
        if (_glassesLeftPosition < 0) _glassesLeftPosition = 0;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomNavigatorItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double viewportHeight = MediaQuery.of(context).size.height;
    double viewportWidth = MediaQuery.of(context).size.width;
    // double boatVerticalCenter = (viewportHeight - _boatHeight) / 2;
    double boatHorizontalCenter = (viewportWidth - _boatWidth) / 2;

    return Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height,
                leading: _glassesLeftPosition == 0
                    ? Image.asset(AppImages.glasses,
                        width: _glassesWidth, height: _glassesHeight)
                    : null,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(Icons.menu_sharp, color: AppColors.black),
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    // fit: StackFit.expand,
                    children: [
                      Image.asset(
                        AppImages.bgd,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      // Center(child: Image.asset(AppImages.glasses, height: 120)),
                      if (_glassesLeftPosition > 0)
                        Positioned(
                            top: _initialGlassesTopPosition,
                            left: _glassesLeftPosition,
                            child: Image.asset(AppImages.glasses,
                                width: _glassesWidth, height: _glassesHeight)),
                      Positioned(
                        top: _initialBoatTopPosition,
                        left: boatHorizontalCenter,
                        child: Image.asset(
                          AppImages.boat,
                          width: _boatWidth,
                          height: _boatHeight,
                        ),
                      ),
                    ],
                  ),
                )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return views[_selectedBottomNavigatorItemIndex];
                },
                childCount: 1,
              ),
            ),
          ],
        ),
        bottomNavigationBar: _isBottomNavVisible
            ? Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: AppColors.greyShade100,
                      spreadRadius: 0,
                      offset: const Offset(0, -1)),
                  BoxShadow(
                      color: AppColors.greyShade100,
                      spreadRadius: 2,
                      offset: const Offset(2, -2))
                ]),
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'Tickets',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.help),
                      label: 'Help',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: _selectedBottomNavigatorItemIndex,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: AppColors.black87.withOpacity(0.7),
                  type: BottomNavigationBarType.fixed,
                  onTap: _onItemTapped,
                ),
              )
            : const SizedBox.shrink());
  }
}
