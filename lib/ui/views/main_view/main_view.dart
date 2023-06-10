import 'package:flutter/material.dart';
import 'package:meal_monkey/core/enums/bottom_navigation.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:meal_monkey/ui/views/main_view/home_view/home_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:meal_monkey/ui/views/main_view/menu_view/menu_view.dart';
import 'package:meal_monkey/ui/views/main_view/more_view/more_view.dart';
import 'package:meal_monkey/ui/views/main_view/offers_view/offers_view.dart';
import 'package:meal_monkey/ui/views/main_view/profile_view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(
          drawerWidth: size.width / 2,
        ),
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                MenuView(),
                OffersView(),
                HomeView(
                  onMenuTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                ProfileView(),
                MoreView(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: BottomNavigationWidget(
                bottomNavigationEnum: selected,
                onTap: (selectedEnum, pageNumber) {
                  controller.animateToPage(
                    pageNumber,
                    duration: Duration(
                      microseconds: 500,
                    ),
                    curve: Curves.easeInCirc,
                  );
                  setState(() {
                    selected = selectedEnum;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
