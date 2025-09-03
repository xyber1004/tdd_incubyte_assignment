import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_incubyte_assignment/home/controllers/home.controller.dart';
import 'package:tdd_incubyte_assignment/home/controllers/home.i.dart';
import 'package:tdd_incubyte_assignment/home/providers/home_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late IHome homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>.value(
      value: homeController.homeProvider,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('TDD Incubyte Assignment',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<HomeProvider>(builder: (context, homeProvider, child) {
                return Text(
                  homeProvider.numText,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: TextField(
                  controller: homeController.numController,
                  decoration: InputDecoration(
                    hintText: 'Enter numbers',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      homeController.parseSum();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      homeController.clear();
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
