import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieverse/screens/home.dart';
import 'package:movieverse/screens/movies.dart';
import 'package:movieverse/screens/profile.dart';
import 'package:movieverse/utils/colors.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  PageController? _pageController;



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: LinearGradient(colors: [
          AppColors().purple7,
          AppColors().purple6
        ]),
        title: Container(
          height: 50,
            width: MediaQuery.of(context).size.width * 0.5,
            child: SvgPicture.asset('assets/movieverselogo.svg' ,fit: BoxFit.cover,)),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Home(),
            Movies(),
            Profile(),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavyBar(
          showElevation: false,
          backgroundColor: AppColors().purple7 ,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController!.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: AppColors().purple_2,
                inactiveColor: AppColors().purple_1,
                title: Text('Home'),
                textAlign: TextAlign.center,
                icon: Icon(Icons.home)
            ),
            BottomNavyBarItem(
                activeColor: AppColors().purple_2,
                inactiveColor: AppColors().purple_1,
                title: Text('Movies'),
                textAlign: TextAlign.center,
                icon: Icon(Icons.movie)
            ),
            BottomNavyBarItem(
                activeColor: AppColors().purple_2,
                inactiveColor: AppColors().purple_1,
                title: Text('Profile'),
                textAlign: TextAlign.center,
                icon: Icon(Icons.person)
            ),

          ],
        ),
    );
  }
}
