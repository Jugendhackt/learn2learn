
import 'package:flutter/material.dart';
const alpakaimages =["alpaka.png","zwinkerndes_Alpaka.png"];
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int image_index=0;
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
            GestureDetector(
              onTap:(){
                image_index++;
                setState(() {

                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 50),
                  child: Image(
              key: UniqueKey(),
                      image: AssetImage("assets/${alpakaimages[image_index%alpakaimages.length]}"))),
            )
          ],
        ),
      )
    );
  }
}
