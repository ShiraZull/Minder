import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int something = 0;

  Future<bool> _reset() async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.remove('loggedIn');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(onPressed: _reset, child: const Text('RESET')),
        ),
        Container(
          height: 400,
          width: 300,
          child: const Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Placeholder(
              fallbackHeight: 200,
              fallbackWidth: 200,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(80, 80)),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
              ),
              child: const Icon(
                Icons.close,
                size: 40,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(80, 80)),
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
              ),
              child: const Icon(
                Icons.favorite,
                size: 40,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
