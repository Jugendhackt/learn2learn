import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:learn2learn/expansion_panel/my_expansion_panel_list.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class LearnMethod {
  const LearnMethod({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          const Text("a"),
          const Text("b"),
          SingleChildScrollView(
            child: FutureBuilder(
                future: entries(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Text("Lade");
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future<MyExpansionPanelList> entries() async {
    YamlMap y_library =
        loadYaml(await rootBundle.loadString("assets/bibliotek.yaml"));
    YamlList library = y_library["bibliotek"]["methoden"];
    List<LearnMethod> methods = library
        .map(
            (e) => LearnMethod(name: e["name"], description: e["beschreibung"]))
        .toList();

    MyExpansionPanelList panelList = MyExpansionPanelList(
        children: methods
            .map((e) =>
                MyExpansionPanel(title: e.name, body: Text(e.description)))
            .toList());

    return panelList;
  }
}
