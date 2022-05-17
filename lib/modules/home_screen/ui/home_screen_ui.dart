import 'package:flutter/material.dart';
import 'package:moovbe/modules/home_screen/home_screen_provider.dart';
import 'package:moovbe/modules/home_screen/model/buslist_model.dart';
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
      context.read<HomeScreenProvider>().retrieveBusList();
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
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 200, bottom: 10),
            child: Text(
              "${provider.busDeatails.busList?.length ?? 0} Buses Found",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: _busList(provider))
        ],
      ),
    );
  }

  Widget _busList(HomeScreenProvider provider) {
    return provider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              BusList bus = provider.busDeatails.busList![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              color: Colors.grey.shade300,
                            ),
                            bus.image != null
                                ? Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                        "assets/images/image 3.png"))
                                : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                        "assets/images/image 3.png")),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            bus.name ?? '',
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {},
                            child: const Text("Manage")),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: provider.busDeatails.busList?.length ?? 0);
  }
}
