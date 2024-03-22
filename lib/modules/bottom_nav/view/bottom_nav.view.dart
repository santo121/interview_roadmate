import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';
import 'package:roadmate_products/modules/bottom_nav/view/featured_products.view.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late CircularBottomNavigationController _navigationController;
  int selectedPos = 2;
  double bottomNavBarHeight = 76;
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  TabItem tabItem(IconData icon, String name) => TabItem(
        icon,
        name,
        kRed,
        circleStrokeColor: Colors.white,
        labelStyle: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      );

  List<TabItem> tabItems() => List.of([
        tabItem(Icons.home_outlined, 'Home'),
        tabItem(Icons.handyman, 'Service'),
        tabItem(Icons.shopping_basket_outlined, 'Products'),
        tabItem(Icons.handshake, 'Market'),
        tabItem(Icons.storefront_sharp, 'My Shop'),
      ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
        body: Stack(
      children: <Widget>[
        bodyContainer(),
        Align(alignment: Alignment.bottomCenter, child: bottomNav())
      ],
    ));
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return const SizedBox();

      case 1:
        return const SizedBox();

      case 2:
        return const FeaturedProducts();

      case 3:
        return const SizedBox();

      case 4:
        return const SizedBox();

      default:
        return const SizedBox();
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      selectedPos: selectedPos,
      iconsSize: 30,
      circleSize: 70,
      tabItems(),
      controller: _navigationController,
      // selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,

      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }
}
