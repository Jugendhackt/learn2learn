import 'package:flutter/material.dart';

import 'home.dart';
import 'learn_it.dart';


class TabPage extends StatefulWidget {
  const TabPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("learn2learn", style: TextStyle(fontSize: 24),),
            actions: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  iconSize: 37,
                  onPressed: () {},
                ),
                // child: Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 37,
                  onPressed: () {},
                ),
                // child: Icon(Icons.account_circle),
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text("Home", style: TextStyle(fontSize: 18),)),
                Tab(
                  child: Text(
                    "Quiz",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(child: Text("Learn It", style: TextStyle(fontSize: 18),)),
              ],
            ),
          ),
          body: const TabBarView(
              children: [
                HomePage(),
                Text("1"),
                LearnPage()
              ]
          ),
    ));
  }
}
