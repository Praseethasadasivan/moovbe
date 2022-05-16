import 'package:flutter/material.dart';
import 'package:moovbe/modules/add_driver/add_driver_provider.dart';
import 'package:moovbe/modules/add_driver/ui/add_driver_ui.dart';
import 'package:provider/provider.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddDriverProvider(),
      child: const AddDriverUI(),
    );
  }
}
