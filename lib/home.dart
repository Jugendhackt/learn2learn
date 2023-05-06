import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8800ff)
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "START!",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 50),
            const Image(image: AssetImage("assets/alpaka.png"))
          ],
        ),
      )
    );
  }
}
