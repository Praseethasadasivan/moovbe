import 'package:flutter/material.dart';
import 'package:moovbe/modules/bus/bus_provider.dart';
import 'package:moovbe/modules/bus/ui/bus_ui.dart';
import 'package:moovbe/modules/home_screen/model/buslist_model.dart';
import 'package:provider/provider.dart';

class Bus extends StatefulWidget {
  final BusList? bus;
  Bus({Key? key, this.bus}) : super(key: key);

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusProvider(),
      child: BusUI(bus: widget.bus),
    );
  }
}
