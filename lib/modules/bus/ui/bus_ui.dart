import 'package:flutter/material.dart';
import 'package:moovbe/modules/bus/bus_provider.dart';
import 'package:moovbe/modules/home_screen/model/buslist_model.dart';
import 'package:moovbe/modules/seat_manage/seat_manage_provider.dart';
import 'package:provider/provider.dart';

class BusUI extends StatefulWidget {
  BusList? bus;
  BusUI({this.bus});

  @override
  State<BusUI> createState() => _BusUIState();
}

class _BusUIState extends State<BusUI> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      int totalCount = widget.bus?.seatCount ?? 0;
      int seatCount = totalCount ~/ 4;
      context.read<BusProvider>().setSeatCount(seatCount);
    });
    // Future.delayed(const Duration(seconds: 3), () {

    // });
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    BusProvider provider = context.watch<BusProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bus?.name ?? 'unknown'),
        backgroundColor: Colors.black,
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(BusProvider provider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 335,
            height: 116,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Row(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, top: 23),
                    child: Text(
                      widget.bus?.driver ?? 'Rohit sharma',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "License no: PJ515196161655",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset('assets/images/driver.png'),
              )
            ]),
          ),
        ),
        Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/images/Seat (1).png')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: constructSeat(provider),
                        ),
                        Visibility(
                            visible: widget.bus?.type?.toUpperCase() == '1X3',
                            child: Column(
                              children: List.filled(
                                  provider.seatCount,
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                  )),
                            )),
                        Column(
                          children: constructSeat(provider),
                        ),
                        Visibility(
                            visible: widget.bus?.type?.toUpperCase() == '2X2',
                            child: Column(
                              children: List.filled(
                                  provider.seatCount,
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                  )),
                            )),
                        Column(
                          children: constructSeat(provider),
                        ),
                        Column(
                          children: constructSeat(provider),
                        )
                      ]),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> constructSeat(BusProvider provider) {
    return List.filled(
        provider.seatCount,
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/Seat.png'),
          ),
        ));
  }
}
