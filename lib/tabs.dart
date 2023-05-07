import 'package:flutter/material.dart';

import 'home.dart';
import 'learn_it.dart';
import 'quiz.dart';
import 'settings.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "learn2learn",
              style: TextStyle(fontSize: 24),
            ),
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
                  icon: const Icon(Icons.settings),
                  iconSize: 37,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
                // child: Icon(Icons.account_circle),
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    child: Text(
                  "Home",
                  style: TextStyle(fontSize: 18),
                )),
                Tab(
                  child: Text(
                    "Quiz",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                    child: Text(
                  "Learn It",
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
          body: const TabBarView(children: [
            HomePage(),
            QuizPage(),
            LearnPage(),
          ]),
        ));
  }
}
