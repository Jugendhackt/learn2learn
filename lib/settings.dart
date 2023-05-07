import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _sliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.settings,
              color: Color(0x99ffffff),
              size: 37,
            ),
            // child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Einstellungen",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: [
                Icon(Icons.volume_up),
                Slider(
                    min: 0,
                    max: 20,
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
