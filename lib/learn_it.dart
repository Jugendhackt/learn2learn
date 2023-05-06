import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;


class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  Future<YamlMap> getFile() async {
    return loadYaml(await rootBundle.loadString("assets/bibliotek.yaml"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("Läd");
          }
        }
    );
  }
}