import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var step = 0;
  Map<String, int> stats = {
    "motorisch": 0,
    "kommunikativ": 0,
    "visuell": 0,
    "auditiv": 0
  };

  Widget getLearnType() {
    List<String> highest = [];
    int max = 0;
    stats.forEach((key, value) {
      if (value > max) {
        highest = [];
        highest.add(key);
        max = value;
      } else if (value == max) {
        highest.add(key);
      }
    });

    List<Widget> types_output = [
      Text(
        "Dein Lerntyp(en) ist: ",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    ];

    for (String type in highest) {
      String text = "";

      if (type == "motorisch") {
        text = "Du bist ein Motorischer-Lerntyp, das heißt du kannst dir  Dinge am besten merken, wenn du sie über Handlungen selbst nachvollzogen hat.";
      }
      if (type == "kommunikativ") {
        text = "Du bist ein Kommunikativer-Lerntyp, das heißt wenn du Informationen mit anderen diskutieren, durchsprechen und jederzeit Fragen stellst, lernst du am besten.";
      }
      if (type == "visuell") {
        text = "Du bist ein Visueller-Lerntyp, das heißt du kannst Handlungsabläufe besser nachvollziehen und verarbeiten, wenn sie visuell dargestellt sind.";
      }
      if (type == "auditiv") {
        text = "Du bist ein Auditiver-Lerntyp, das heißt du kannst besonders gut gehörte Informationen aufnehmen, sie behalten und wiedergeben. Dadurch sollte es besonders leicht sein zu verstehen, was der Lehrer erklärt.";
      }

      types_output.add(
          Text(type, style: Theme.of(context).textTheme.headlineMedium,)
      );

      types_output.add(
          Text(text)
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types_output,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: question(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("Lade");
          }
        },
      )
    );
  }

  Future<Widget> question() async {
    YamlMap library = loadYaml(await rootBundle.loadString("assets/bibliotek.yaml"));
    if (step > library["bibliotek"]["quiz"].length - 1) {
      return getLearnType();
    } else {
      YamlMap question = library["bibliotek"]["quiz"][step];
      String frage = question["frage"];
      int bstat = step + 1;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$bstat. $frage",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 100),
          answerButton(question["antworten"][0]["text"], question["antworten"][0]["typ"]),
          const SizedBox(height: 25),
          answerButton(question["antworten"][1]["text"], question["antworten"][1]["typ"]),
          const SizedBox(height: 25),
          answerButton(question["antworten"][2]["text"], question["antworten"][2]["typ"]),
          const SizedBox(height: 25),
          answerButton(question["antworten"][3]["text"], question["antworten"][3]["typ"]),
        ],
      );
    }
  }

  Widget answerButton(String text, String type) {
    return OutlinedButton(
      onPressed: () {
        if (type != "ungültig") {
          stats[type] = stats[type]! + 1;
        }

        setState(() {
          step++;
        });
      },
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple, width: 2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      )
    );
  }
}
