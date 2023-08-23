import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_practice/mini_app_store/screens/settings_screen/settings.dart';
import '../utils/constants.dart';
import '../widgets/home/home_body.dart';
import 'favorite_screen/favorite.dart';

class HomeScreen extends StatefulWidget {
  static const String homeScreen = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeBody(),
    const FavoritesTab(),
    const SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "اعدادات")
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(
            () => _currentIndex = value,
          );
        },
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'مرحبا بكم بمتجر الالكترونيات',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: true,
    );
  }
}
