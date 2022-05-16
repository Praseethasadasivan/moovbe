import 'package:flutter/material.dart';
import 'package:moovbe/modules/home_screen/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  @override
  State<HomeScreenUI> createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<HomeScreenProvider>().retrieveBusList();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider provider = context.watch<HomeScreenProvider>();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 3,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/logo.png',
              width: 129,
              height: 30,
            ),
          ])),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(HomeScreenProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 158,
                height: 176,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Bus",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Manage your Bus",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 10),
                      child: Image.asset("assets/images/image 2.png"),
                    )
                  ],
                ),
              ),
              Container(
                width: 158,
                height: 176,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Driver",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Manage your Driver",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                      ),
                      child: Image.asset(
                        "assets/images/driver.png",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: _busList(provider))
        ],
      ),
    );
  }

  Widget _busList(HomeScreenProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 210),
      child: Text(
        "21 Buses Found",
        style: TextStyle(
            fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
