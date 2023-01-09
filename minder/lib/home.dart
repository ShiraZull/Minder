import 'dart:ffi';

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
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                height: 400,
                width: 300,
              ),
            ),
          ),
          Row(
            children: [
              // IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              // IconButton(onPressed: () {}, icon: const Icon(Icons.heat_pump_rounded)),
              TextButton(onPressed: _reset, child: Text('RESET'))
            ],
          )
        ],
      ),
    );
  }
}
