import 'package:flutter/material.dart';
import 'package:heal_tether/user_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 121, 233),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 130, left: 50),
            child: Text(
              'Let\'s sign you in',
              style: TextStyle(
                color: Color.fromARGB(255, 225, 219, 231),
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Validation()));
                },
                child: const Text(
                  "Let's Start",
                )),
          )
        ],
      ),
    );
  }
}
