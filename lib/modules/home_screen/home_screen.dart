import 'package:flutter/material.dart';
import 'package:moovbe/modules/home_screen/home_screen_provider.dart';
import 'package:moovbe/modules/home_screen/ui/home_screen_ui.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: const HomeScreenUI(),
    );
  }
}
